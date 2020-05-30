import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_state.dart';
import 'package:scoped_guide/scoped_models/success_model.dart';
import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';

import 'base_view.dart';

class SuccessView extends StatelessWidget {
  
  final String title;

  SuccessView({this.title});//Passed in from home이 전달됨. 

  @override
  Widget build(BuildContext context) { //동일한 BaseView을 기준으로 SuccessModel만 달라짐. 
    return BaseView<SuccessModel>(//BaseView<SuccessModel 이런식으로 사용. 
        onModelReady: (model) => model.fetchDuplicatedText(title),//2초후에 진행
        builder: (context, child, model) => BusyOverlay( //BusyOverlay도 위젯 
            show: model.state == ViewState.Busy,
            child: Scaffold(
              body: Center(child: Text(model.title)),
            )));
  }
}
