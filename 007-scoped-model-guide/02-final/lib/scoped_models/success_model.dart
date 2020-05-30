import 'package:scoped_guide/scoped_models/base_model.dart';

//각 모델은 BaseModel을 가짐
class SuccessModel extends BaseModel {

  String title = "no text yet";

  Future fetchDuplicatedText(String text) async {
    setState(ViewState.Busy);//BaseModel에서 상속받은 ViewState을 Busy로 변경. 
    await Future.delayed(Duration(seconds: 2));
    title = '$text';

    setState(ViewState.Retrieved);
  }
}