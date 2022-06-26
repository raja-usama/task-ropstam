import 'package:get/get.dart';
import 'package:task_ropstam/views/login.dart';
import '../views/home_screen.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
        name: "/home",
        page: () => HomeScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: "/login",
        page: () => Login(),
        transition: Transition.leftToRight),
  ];
}
