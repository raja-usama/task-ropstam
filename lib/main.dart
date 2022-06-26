import 'package:flutter/material.dart';
import 'package:task_ropstam/utils/routes.dart';
import 'package:task_ropstam/views/home_screen.dart';
import 'package:task_ropstam/views/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = (prefs.getString('token') == null) ? false : true;

  runApp(GetMaterialApp(
    initialRoute: "/",
    getPages: Routes.pages,
    title: 'Flutter Demo',
    home: isLoggedIn ? HomeScreen() : Login(),
  ));
}
