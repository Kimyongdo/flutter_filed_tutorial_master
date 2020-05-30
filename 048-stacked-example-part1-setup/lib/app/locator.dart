import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.iconfig.dart'; //iconfig.dart는 매우 중요하다. 


//Get_it == locator임. 
final locator = GetIt.instance;

@injectableInit//injectableInit은 get_it을 편리하게 사용하기 위한 라이브러리. 
void setupLocator() => $initGetIt(locator);//$initGetIt가 injectableInit의 라이브러리. 
                                          //다이얼로그와 네비게이션 서비스에 이를 넣기. 
