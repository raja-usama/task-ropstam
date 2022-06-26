import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/home_data_model.dart';
import '../utils/urls.dart';

class RemoteService {
  static var client = http.Client();

  loginService(email, pass) async {
    var res = await http.post(Uri.parse(
        "${Url.login}?email=$email&password=$pass&device_token=zasdcvgtghnkiuhgfde345tewasdfghjkm"));
    return res;
  }

  static fetchHomeData() async {
    HomeDataModel model = HomeDataModel();
    List<HomeDataModel> list = [];

    var res = await client.get(Uri.parse(Url.getItems));

    if (res.statusCode == 200) {
      var jsonString = json.decode(res.body);
      jsonString.forEach((data) {
        model = HomeDataModel.fromJson(data);
        list.add(model);
      });

      return list;
    } else {
      return null;
    }
  }
}
