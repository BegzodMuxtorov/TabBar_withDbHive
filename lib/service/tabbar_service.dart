import 'package:dio/dio.dart';
import 'package:tabbar/models/contacts_model.dart';
import 'package:tabbar/models/favorite_model.dart';
import 'package:tabbar/models/recents_model.dart';

class TabBarService {
  Future<dynamic> getFavoriteData() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Favoritemodel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      e.message.toString();
    }
  }

  Future<dynamic> getRecentData() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
          print(response.data);
      if (response.statusCode == 200) {
        print(response.data);
        return (response.data as List)
            .map((e) => RecentModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      e.message.toString();
    }
  }

  Future<dynamic> getContactsData() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/albums");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => ContactModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      e.message.toString();
    }
  }

  Future<dynamic> getVoicemailData() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return Favoritemodel.fromJson(response.data);
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      e.message.toString();
    }
  }
}
