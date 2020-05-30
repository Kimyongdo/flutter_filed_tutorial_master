import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

//서비스 만들기. 
@module
abstract class ThirdPartyServicesModule {
  @lazySingleton//injectable라이브러리. 
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
}

//여기서 이걸 만들고 flutter pub run build_runner build을 사용하면
//locator.icofig.dart가 생성된다.
//injectiable을 쓰지 않았다면
// void setupLocator() {
//   locator.registerLazySingleton(() => NavigationService());
//   locator.registerLazySingleton(() => DialogService());
// }로 locater에 추가해야만한다. 

