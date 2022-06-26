import 'package:get/get.dart';
import 'package:task_ropstam/model/home_data_model.dart';
import 'package:task_ropstam/services/remote_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var dataList = <HomeDataModel>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void fetchHomeData() async {
    var data = await RemoteService.fetchHomeData();
    if (data != null) {
      dataList.value = data;
      isLoading.value = false;
    } else {
      return null;
    }
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }
}
