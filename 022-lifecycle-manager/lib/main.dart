import 'package:flutter/material.dart';
import 'package:lifecycle_manager/locator.dart';

import 'lifecycle_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager( //LifeCycleManager 위젯으로 하위를 감쌈. 
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Center(
            child: FlutterLogo(),//FlutterLogo는 그냥 이미지. 
          ),
        ),
      ),
    );
  }
}
