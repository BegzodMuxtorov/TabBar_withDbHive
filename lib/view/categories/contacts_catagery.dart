import 'package:flutter/material.dart';
import 'package:tabbar/db/contacts_db.dart';
import 'package:tabbar/models/contacts_model.dart';



class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ContactsDBService().checkContacts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.data is String) {
            return Center(
              child: Text(snapshot.data),
            );
          } else {
            List<ContactModel> data = snapshot.data as List<ContactModel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].title.toString()),
                );
              },
              itemCount: data.length,
            );
          }
        },);
  }
}
