import 'package:flutter/material.dart';

class Home extends StatelessWidget { //FutureBuilder을 쓰면 Stateless으로 변경가능. 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _getListData(); //Future의 단점 : 단 한번만 불러지므로, 이 버튼을 눌러도 다시 작동되지 않음. 
      }),
        backgroundColor: Colors.grey[900],
        body: FutureBuilder( //future와 builder가 거의 필수요소.  - setState()없이 쓰기 위해서. 
          future: _getListData(), //Future<List<String>>
          builder: (buildContext, snapshot) {//snapshot 이 정보에 _getListData의 Future State가 들어감. 

            if(snapshot.hasError) {//snapshot을 써서 Future 상태를 알림. 
              return _getInformationMessage(snapshot.error);
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var listItems = snapshot.data;//Future data를 얻음. 
            if(listItems.length == 0) {
              return _getInformationMessage('No data found for your account. Add something and check back.');
            }

            return ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (buildContext, index) => _getListItemUi(index, listItems));
          }
        ));
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

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ));
  }

  Future<List<String>> _getListData( //List<String를 반환 
      {bool hasError = false, bool hasData = true}) async {
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return Future.error(
          'An error occurred while fetching the data. Please try again later.');
    }

    if (!hasData) {
      return List<String>();
    }

    return List<String>.generate(10, (index) => '$index title');
  }
}
