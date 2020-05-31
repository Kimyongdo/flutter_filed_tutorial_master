import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_app/ui/views/home/home_view.dart';
import 'package:my_app/ui/views/startup/startup_view.dart';


//auto_Route 라이브러리 사용. 
@MaterialAutoRouter()
class $Router { //$를 써줘야 여기가 라우트 클래스인지 인지함.
  @initial 
  StartupView startupViewRoute; //@initial을 쓰면 그 아래 참조변수가 가장 첫번째로 / 로 만들어짐
  HomeView homeViewRoute;        //두번째는 /homeViewRoute 로 만들어짐.
}


//다 만들고 나서는 flutter pub run build_runner build을 쓰면 router.gr.dart가 생성됨. 