import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ropstam/services/remote_services.dart';

class LoginController extends GetxController {
  var isHide = true.obs;
  var count = 0.obs;
  var isTrue = false.obs;

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  login(email, pass) async {
    dynamic decodeString;
    final prefs = await SharedPreferences.getInstance();
    var res = await RemoteService().loginService(email.text, pass.text);
    if (res.statusCode == 200) {
      decodeString = await json.decode(res.body);
      if (decodeString["data"] != null) {
        await prefs.setString('token', decodeString["data"]["access_token"]);
        isTrue.value = true;
      } else {
        return decodeString["meta"]["message"];
      }
    }
  }
}
