import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {

//locator<NavigationService>();을 사용함으로써 NavigationService 객체를 따로 new하지 않고 바로 사용가능함. 
  final NavigationService _navigationService = locator<NavigationService>(); //결국엔 NavigationService임. 



  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);//navigateTo는 Get의 라이브러리. context없이 사용가능. 
                                                             //GET을 사용안했는데 어떻게 이게 가능한거지. 
  }
}


//네비게이션 : 페이지 위에 페이지 그리는 방식이기 때문에 Future을 사용해서 끝날때까지 기다려줘야한다. 

