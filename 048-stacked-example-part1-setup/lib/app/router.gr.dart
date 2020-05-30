// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_app/ui/views/startup/startup_view.dart';
import 'package:my_app/ui/views/home/home_view.dart';

abstract class Routes {
  static const startupViewRoute = '/';
  static const homeViewRoute = '/home-view-route'; //라우트 편하게 짓기 위한 방법
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startupViewRoute: //startupViewRoute라면. 
        if (hasInvalidArgs<StartupViewArguments>(args)) {
          return misTypedArgsRoute<StartupViewArguments>(args);
        }
        final typedArgs =
            args as StartupViewArguments ?? StartupViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => StartupView(key: typedArgs.key),//StartupView로 이동하도록 설정. 
          settings: settings,
        );
//////////////////////////////여기까지가 하나의 Route///////////////////////////////////////


        //homeViewRoute라면. 
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//StartupView arguments holder class
class StartupViewArguments {
  final Key key;
  StartupViewArguments({this.key});
}

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}
