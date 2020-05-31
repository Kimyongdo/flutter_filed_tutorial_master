import 'package:flutter/material.dart';
import 'package:my_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Start up view'),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => model.navigateToHome()),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}

//VM이름 짓는게 매우 매우 중요하다
// get set를 기준으로 짓기
// void getCode(String name){
// get 
// }
