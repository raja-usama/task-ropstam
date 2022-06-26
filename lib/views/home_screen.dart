import 'package:flutter/material.dart';
import 'package:task_ropstam/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:task_ropstam/utils/text_styles.dart';
import '../widgets/card_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
 final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            "Home Screen",
            style: buttonText,
          ),
          trailing: GestureDetector(
              onTap: () {
                Get.defaultDialog(
                    title: "Log Out",
                    middleText: "Are you sure you want to log out?",
                    onConfirm: () async {
                      await controller.logOut();
                      Get.offNamed("/login");
                    },
                    onCancel: () {
                      Get.back();
                    });
              },
              child: const Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => controller.isLoading.value
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()))
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      return ListCard(
                        model: controller.dataList[index],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
