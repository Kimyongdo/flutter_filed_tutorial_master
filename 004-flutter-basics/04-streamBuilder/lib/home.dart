import 'package:flutter/material.dart';
import 'dart:async';

enum HomeViewState { Busy, DataRetrieved, NoData }// 3개의 상태로 구분함. 

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  //StreamBuilder를 사용하기 위해서는 Controller를 사용. HomeViewState를 가짐. 
  final StreamController<HomeViewState> stateController = StreamController<HomeViewState>();
  List<String> listItems;

  @override
  void initState() {
    _getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          _getListData();
        }),
        backgroundColor: Colors.grey[900],
        body: StreamBuilder( //StreamBuilder으로 변경함. stream과 builder를 사용. 
            stream: stateController.stream,
            builder: (buildContext, snapshot) { //snapshot을 이용하며 이 값을 streamController와 비교. 
              if (snapshot.hasError) {
                return _getInformationMessage(snapshot.error);
              }

              // Use busy indicator instead of hasData from snapShot
              if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                return Center(child: CircularProgressIndicator());
              }

              // use explicit state instead of checking the lenght
              if (snapshot.data == HomeViewState.NoData) {
                return _getInformationMessage(
                    'No data found for your account. Add something and check back.');
              }

              return ListView.builder(
                  itemCount: listItems.length, //총량 length -> index 
                  itemBuilder: (buildContext, index) =>
                      _getListItemUi(index, listItems));
            }));
  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
        child: Text(
          listItems[index],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

//오류위젯
  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ));
  }

//데이터 받아오기
  Future _getListData({bool hasError = false, bool hasData = true}) async {
    stateController.add(HomeViewState.Busy); //async await 사이에 Busy를 add함. 
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
     return stateController.addError(
          'An error occurred while fetching the data. Please try again later.');
    }

    if (!hasData) {//data가 없다면 컨트롤러에 Nodata를 넣음. FutureBuilder였다면 Future.error를 반환. 
      return stateController.add(HomeViewState.NoData);
    }

    listItems = List<String>.generate(10, (index) => '$index title');
    stateController.add(HomeViewState.DataRetrieved); 
  }
}
