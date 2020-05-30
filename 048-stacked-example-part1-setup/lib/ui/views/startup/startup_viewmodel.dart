import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();//locate의 NavigationService을 사용. 

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);//navigateTo는 Get의 라이브러리. context없이 사용가능. 
                                                             //GET을 사용안했는데 어떻게 이게 가능한거지. 
  }
}
