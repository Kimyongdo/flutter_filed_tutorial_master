import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key key}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 125,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),//상하좌우 모두 둥그런 네모 
                boxShadow: [
                  BoxShadow( //주변 하이라이트 느낌. 
                      blurRadius: 10, color: Colors.blue[300], spreadRadius: 5)
                ]),
            child: Column(
              children: <Widget>[
                DecoratedTextField(),
                SheetButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DecoratedTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: //적어놓을 내용 
            InputDecoration.collapsed(hintText: 'Enter your reference number'),
      ),
    );
  }
}


//이 버튼을 누르면. 
class SheetButton extends StatefulWidget {
  SheetButton({Key key}) : super(key: key);

  _SheetButtonState createState() => _SheetButtonState();
}

class _SheetButtonState extends State<SheetButton> {
  
  bool checkingFlight = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return !checkingFlight
        ? MaterialButton(
            color: Colors.grey[800],
            onPressed: () async { //onPressed에서 async를 달고. 
              setState(() {
               checkingFlight = true;  //다시 true로 변경 
              });

              await Future.delayed(Duration(seconds:2)); //1초 기다리고. success가 false니까 계속 돎. 

              setState(() {
               success = true;  //sucess도 true -> 체크아이콘 생성 
              });

              await Future.delayed(Duration(milliseconds: 500)); //0.5초 기다림

              Navigator.pop(context); //꺼짐. 
            },
            child: Text(
              'Check Flight',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : !success
            ? CircularProgressIndicator() //fale라면
            : Icon(  //true라면 
                Icons.check,
                color: Colors.green,
              );
  }
}
