import 'package:flutter/material.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_guide/ui/views/error_view.dart';
import 'package:scoped_guide/ui/views/success_view.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) =>//model은 곧 HomeModel임. 
       BusyOverlay(
        show: model.state == ViewState.Busy,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              bool whereToNavigate = await model.saveData(); //Busy로 setState() -> retrived로 setState()
              if (whereToNavigate) {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessView(title: "Passed in from home")));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ErrorView()));
              }
            },
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                _getStateUi(model.state),//Done
                Text(model.title),//HomeModel 
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _getStateUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();//onPressed로 클릭시 Busy강태로 오면 이 써클이 돌고 
      case ViewState.Retrieved: return Text("Retrieved"); //두번째 뒤에 이걸로 변경하고. 
      default:
        return Text('Done'); //기본이 Done으로 표시. 
    }
  }
}
