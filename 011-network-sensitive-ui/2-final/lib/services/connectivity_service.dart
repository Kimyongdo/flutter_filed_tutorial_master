import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:network_aware/enums/connectivity_status.dart';

class ConnectivityService {
  
  //컨트롤러 
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>(); 

  ConnectivityService() {
    //Connectivity 라이브러리. - 변화감지 wifi mobile non 
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
       connectionStatusController.add(_getStatusFromResult(result)); //Connectivity -> 컨트롤러에 그 결과를 추가하기. 
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}