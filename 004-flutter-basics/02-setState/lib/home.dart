import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _pageData;

  bool get _fetchingData => _pageData == null;

  @override
  void initState() {
    _getListData(hasError: true).then((data) => 
        setState(() {
          if(data.length == 0) {
            data.add('No data found for your account. Add something and check back.');
          }
          _pageData = data;  //data == List<String> (0~9)10r개 호출 
        }))
        .catchError((error) => 
        setState((){
          _pageData = [error]; //에러를 List에 넣기. 배열이므로 [ ]를 추가함. 
        }));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: _fetchingData //삼항연산자. 
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(  //ListView.Builder안에 꼭 ListTile이 들어갈 필요 없음. itemBuilder를 수만큼 뿌릴뿐. 
        itemCount: _pageData.length,
        itemBuilder: (buildContext, index) =>_getListItemUi(index)//_pageData.length,-> index
    ));
  }

//index만큼(length) 여기를 반복함. 
  Widget _getListItemUi(int index) {
    return  Container(
          margin: EdgeInsets.all(5.0),
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[600]
          ),
          child: Center(
            child: Text(_pageData[index], style: TextStyle(color: Colors.white,),
        ),
          ),
      );
  }

  Future<List<String>> _getListData({
   
    bool hasError = false,
    bool hasData = true}) async {
    await Future.delayed(Duration(seconds: 2));

    if(hasError) { //에러라면
      return Future.error('An error occurred while fetching the data. Please try again later.');
    }

    if(!hasData) { //데이터가 없다면
      return List<String>();
    }

     //모두 제대로 있다면. 
    return List<String>.generate(10, (index) => '$index title');//10개를 생성 및 반환. 
  }
}
