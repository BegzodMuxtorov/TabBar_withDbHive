import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabbar/models/contacts_model.dart';
import 'package:tabbar/models/favorite_model.dart';
import 'package:tabbar/service/tabbar_service.dart';



class ContactsDBService {
  Box<ContactModel>? box;
  TabBarService tabBarService = TabBarService();

  Future<dynamic> checkContacts() async {
    await openBox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getContacts();
    }
  }

  Future<dynamic> getContacts() async {
    dynamic response = await tabBarService.getContactsData();
    if (response is List<ContactModel>) {
      await openBox();
      await writeContacs(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<ContactModel>("ContactsDB");
  }

  Future<void> writeContacs(List<ContactModel> model) async {
    await openBox();

    await box!.addAll(model);
  }

  static void registerAdap() async {
    Hive.registerAdapter(ContactModelAdapter());
 
  }
}
