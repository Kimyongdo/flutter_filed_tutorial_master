import 'package:dependency_injection/app_info.dart';
import 'package:flutter/material.dart';


//의존성 주입 3가지 중 하나 InheritedWidget을 쓰는 방법


class InheritedInjection extends InheritedWidget { //InheritedWidget을 사용해서 데이터들에게 접근하는 방법

  final AppInfo _appInfo = AppInfo();//AppInfo 객체를 InheritedWidget상속한 클래스 내부에 들여옴. 
  final Widget child;

  InheritedInjection({Key key, this.child}) : super(key: key, child: child);

  AppInfo get appInfo => _appInfo;

  static InheritedInjection of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedInjection)as InheritedInjection);
  }

  @override
  bool updateShouldNotify( InheritedInjection oldWidget) {
    return true;
  }
}