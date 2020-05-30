import 'package:flutter/material.dart';
import 'package:scoped_guide/ui/views/home_view.dart';
import 'service_locator.dart';

void main() {
  setupLocator(); //get_it 을 저장 후 main위에서 쓰기. 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
