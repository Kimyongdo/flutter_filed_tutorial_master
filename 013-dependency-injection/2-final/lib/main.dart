import 'package:dependency_injection/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_info.dart';
import 'locator.dart';

void main() {
  setupLocator();//get_it 사용하는 방법 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(  //InheritedInjection()으로 감싸거나 
      builder: (context) => AppInfo(),//AppInfo을 넣음. 이 tree에 감싸진 모든 위젯은 AppInfo를 알아들음. 
      child: MaterialApp(
        title: 'Dependency Injection',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
