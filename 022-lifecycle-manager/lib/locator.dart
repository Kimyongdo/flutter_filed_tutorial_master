
import 'package:get_it/get_it.dart';
import 'package:lifecycle_manager/services/background_fetch_service.dart';
import 'package:lifecycle_manager/services/location_service.dart';

GetIt locator = GetIt();

void setupLocator() {//GetIt을 통해서 이 서비스들이 어디서든 들을 수 있게 설정. 
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
}