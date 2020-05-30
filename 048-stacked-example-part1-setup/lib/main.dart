import 'package:flutter/material.dart';
import 'package:my_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart';

void main() {
  setupLocator();//get_it 라이브러리 - runApp이 시작하기 전에 먼저 호출
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.startupViewRoute, //초기 view는 auto_route를 이용해서 사용.
      onGenerateRoute: Router().onGenerateRoute, //다른 경로들이 여기로 지정됨. 
      navigatorKey: locator<NavigationService>().navigatorKey, //NavigationService의 key를 사용하도록 설정 locate()를 쓰면 어디서든 쓸 수 있음. 
      //NavigationService은 기본 Flutter 제공임. 
    );
  }
}
