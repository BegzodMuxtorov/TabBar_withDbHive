import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabbar/models/favorite_model.dart';
import 'package:tabbar/service/tabbar_service.dart';



class FavoriteDBService {
  Box<Favoritemodel>? box;
  TabBarService tabBarService = TabBarService();

  Future<dynamic> checkFavorite() async {
    await openBox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getFavorite();
    }
  }

  Future<dynamic> getFavorite() async {
    dynamic response = await tabBarService.getFavoriteData();
    if (response is List<Favoritemodel>) {
      await openBox();
      await writeFavorite(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<Favoritemodel>("FavoriteDb");
  }

  Future<void> writeFavorite(List<Favoritemodel> model) async {
    await openBox();

    await box!.addAll(model);
  }

  static void registerAdap() async {
    Hive.registerAdapter(FavoritemodelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}
