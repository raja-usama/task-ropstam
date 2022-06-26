import 'package:flutter/material.dart';
import 'package:task_ropstam/controller/login_controller.dart';
import 'package:get/get.dart';
import '../utils/text_styles.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.centerRight,
                end: FractionalOffset.topCenter,
                colors: [Colors.white, Colors.greenAccent.shade100])),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hello Again!!",
                style: heading,
              ),
              spacing(),
              const Text(
                "Chances to get your life better",
                style: normalText,
              ),
              spacing(),
              spacing(),
              SizedBox(
                width: 300,
                // height: 50,
                child: Obx(() => TextFormField(
                      validator: (value) {
                        if (GetUtils.isEmail(value.toString())) {
                          return null;
                        }
                        return "Email is not Valid";
                      },
                      controller: controller.emailController.value,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          labelText: "Enter Email",
                          labelStyle: const TextStyle(color: Colors.black),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                              borderRadius: BorderRadius.circular(32.0)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20.0)),
                          focusColor: Colors.black),
                    )),
              ),
              spacing(),
              spacing(),
              SizedBox(
                width: 300,
                child: Obx(
                  () => TextFormField(
                    validator: (value) {
                      if (value.toString().length > 5) {
                        return null;
                      }
                      return "Password must be greater than 4";
                    },
                    controller: controller.passwordController.value,
                    obscureText: controller.isHide.value,
                    decoration: InputDecoration(
                        suffix: GestureDetector(
                          onTap: () {
                            if (controller.count % 2 == 0) {
                              controller.isHide.value = false;
                            } else {
                              controller.isHide.value = true;
                            }
                            controller.count++;
                          },
                          child: const Icon(
                            Icons.remove_red_eye_sharp,
                            size: 15,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        labelText: "Enter Password",
                        labelStyle: const TextStyle(color: Colors.black),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(32.0)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusColor: Colors.black),
                  ),
                ),
              ),
              spacing(),
              spacing(),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var res = await controller.login(
                        controller.emailController.value,
                        controller.passwordController.value);

                    if (controller.isTrue.value) {
                      Get.offAllNamed("/home");
                    } else if (controller.isTrue.value == false) {
                      Get.snackbar("Error", res.toString());
                    }
                  }
                },
                color: Colors.greenAccent,
                minWidth: 300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Login",
                  style: buttonText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget spacing() {
    return const SizedBox(
      height: 20,
    );
  }
}
