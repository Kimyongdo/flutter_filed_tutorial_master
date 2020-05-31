import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => '$_title $_counter';

  int _counter = 0;
  int get counter => _counter; //바로 받아오는거


  // void getCounter(){
  // counter*10;  
  //   return _counter;  식으로 바꿀 수 있음. 
  // }

  void updateCounter() {
    _counter++;
  //  notifyListeners();
  }
}


// 