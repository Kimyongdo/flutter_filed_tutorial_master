import 'package:get_it/get_it.dart';

import 'app_info.dart';

//의존성 주입 3가지 중 하나 GetIt 쓰는 방법

GetIt locator = GetIt();

void setupLocator() {
  locator.registerFactory(() => AppInfo());//AppInfo을 어디서든 들을 수 있게. 
}