import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

//서비스 만들기. 
//locator에 코드를 추가하지 않게 하기 위한 방법. 
@module
abstract class ThirdPartyServicesModule {
  @lazySingleton//injectable라이브러리. 
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
}

//여기서 이걸 만들고 flutter pub run build_runner build을 사용하면
//locator.icofig.dart가 생성된다.
//injectiable을 쓰지 않았다면 -> locater.dart에서 아래와 같이 추가를 해야한다. -> 보다 분리하기 위함임. 
// void setupLocator() {
//   locator.registerLazySingleton(() => NavigationService());
//   locator.registerLazySingleton(() => DialogService());
// }로 locater에 추가해야만한다. 

