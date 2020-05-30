import 'package:flutter/material.dart';

class BusyOverlay extends StatelessWidget {

  final Widget child;
  final String title;
  final bool show;

  const BusyOverlay({this.child,         //생성자. 
      this.title = 'Please wait...',
      this.show = false});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //핸드폰 사이즈. 
    return Material(
        child: Stack(children: <Widget>[
      child,
      IgnorePointer(
        child: Opacity(
            opacity: show ? 1.0 : 0.0, //밝게 혹은 어둡게. 
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              alignment: Alignment.center,
              color: Color.fromARGB(100, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),//결국 CircularProgressIndicator이거 보여주기. 
                  Text(title,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            )),
      ),
    ]));
  }
}
