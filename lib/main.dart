import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabbar/db/contacts_db.dart';
import 'package:tabbar/db/favorite_db.dart';
import 'package:tabbar/db/recent_db.dart';
import 'package:tabbar/view/home_page.dart';

void main() async {
  await Hive.initFlutter();
  RecentDbService.registerAdap();
  FavoriteDBService.registerAdap();
  ContactsDBService.registerAdap();

  runApp(TabBarApp());
}

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
