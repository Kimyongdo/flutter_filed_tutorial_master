import 'package:dependency_injection/inherited_injection.dart';
import 'package:dependency_injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_info.dart';


//일부러 subTree를 많이 만들어서 맨 아래에서도 작동되는지 확인하기. 
class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyList()
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostItem();
  }
} 

class PostItem extends StatelessWidget {
  const PostItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostMenu();
  }
}

class PostMenu extends StatelessWidget {
  const PostMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostAction();
  }
}

class PostAction extends StatelessWidget {
  const PostAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton();
  }
}


//하위 트리 여러개 만들어서 쭉 내려와도 app_Info.dart의 데이터를 알아들을 수 있음. 
class LikeButton extends StatelessWidget {
  const LikeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appInfo = Provider.of<AppInfo>(context);  //이 문장을 써서 알아듣게 한다. 
    return Container(
      child: Text(appInfo.welcomeMessage),
    );
  }
}