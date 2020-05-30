import 'package:flutter/material.dart';
import 'package:lifecycle_manager/locator.dart';
import 'package:lifecycle_manager/services/background_fetch_service.dart';
import 'package:lifecycle_manager/services/location_service.dart';
import 'package:lifecycle_manager/services/stoppable_service.dart';

/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {

  final Widget child; //main에 있는 child를 보냄(플러터 로고). 
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>

    with WidgetsBindingObserver { //WidgetsBindingObserver을 사용해서 service start and stop을 관리. 
  List<StoppableService> servicesToManage = [ //옵저버로 관리할 서비스 두개를 넣음. get_it사용. 
    locator<LocationService>(),
    locator<BackgroundFetchService>(),
  ];

  // Get all services

  @override
  Widget build(BuildContext context) { //빌드 
    return widget.child;
  }

  @override
  void initState() { //초기
    super.initState();
    WidgetsBinding.instance.addObserver(this);//초기에 추가
  }

  @override
  void dispose() { //끝
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);//끝날때 제거. 
  }

//didChangeAppLifecycleState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service) {
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    });
  }
}
