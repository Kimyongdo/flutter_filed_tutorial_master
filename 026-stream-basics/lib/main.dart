import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamController<double> controller = StreamController<double>.broadcast();//Stream 사용시 필수요소. controller로 값을 넣음. 
  //StreamController<double> controller = StreamController<double>.broadcast();을 써야 중간에 cancel을 해야한다. 
  StreamSubscription<double> streamSubscription; 

  @override
  Widget build(BuildContext context) {
  
  Stream stream = controller.stream; //여기다가 controller stream을 쓴다. 
   

    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MaterialButton(
                  child: Text('Subscribe'),
                  color: Colors.yellow,
                  onPressed: () async {
                    getDelayedRandomValue().listen((value) { //value는 random.nextDouble()을 의미함. 
                      print('Value from manualStream: $value');
                    });
                  },
                ),
                MaterialButton(
                  child: Text('Emit Value'),
                  color: Colors.blue[200],
                  onPressed: () {
                
                    controller.add(12.0); //값을 추가하려면 controller에다가 넣어야함.  -> 12가 출력됨. 
                    streamSubscription = stream.listen((event) {print("this is a $event");}); //한번만 들어도 듣고 있음. 
                  
                  },
                ),
                MaterialButton(
                  child: Text('Unsubscribe'),
                  color: Colors.red[200],
                  onPressed: () {
                    streamSubscription?.cancel(); //하나의 스트림 생성후 취소한다고 다른 스트림을 얻을 수는 없음 <중요>
                    print("${streamSubscription.toString()}");
                  },
                )
              ],
            ),
          ),
        ));
  }

  //onPress로 클릭시 마다 계속 호출이 가능(Future와는 다른 특징)
  Stream<double> getDelayedRandomValue() async* {
    var random = Random();
                    //Stream은 Futurue을 반복적으로 반환하기 위해 만들어짐. Future자체는 한번만 시행되기때문에. 
                   //그래서 Stream안에 for, while문은 등 반복되는 코드가 있음. 
    while (true) { //Stream안에서 return 주는 값은 Future이기에 다른곳에서 await을 사용하거나 then을 사용해야함.
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble(); //yield == return 
    }
  }
}
