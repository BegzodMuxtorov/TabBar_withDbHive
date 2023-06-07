import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabbar/models/recents_model.dart';
import 'package:tabbar/service/tabbar_service.dart';

class RecentDbService {
  Box<RecentModel>? box;
  TabBarService tabBarService = TabBarService();

  Future<dynamic> checkRecent() async {
    await openBox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getRecent();
    }
  }

  Future<dynamic> getRecent() async {
    dynamic response = await tabBarService.getRecentData();
    if (response is List<RecentModel>) {
      await openBox();
      await writeRecent(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<RecentModel>("RecentDB");
  }

  Future<void> writeRecent(List<RecentModel> model) async {
    await openBox();

    await box!.addAll(model);
  }

  static void registerAdap() async {
    Hive.registerAdapter(RecentModelAdapter());
  }
}
