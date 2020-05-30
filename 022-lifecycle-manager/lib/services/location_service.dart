import 'package:lifecycle_manager/services/stoppable_service.dart';

class LocationService extends StoppableService {

  @override //오버라이드함. StoppableService가 추상클래스이므로. 
  void start() {
    super.start();
    print('LocationService Started $serviceStopped');
  }

  @override
  void stop() {
    super.stop();
    print('LocationService Stopped $serviceStopped');
  }
}