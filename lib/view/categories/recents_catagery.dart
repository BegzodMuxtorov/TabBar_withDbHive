import 'package:flutter/material.dart';
import 'package:tabbar/db/recent_db.dart';
import 'package:tabbar/models/recents_model.dart';


class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RecentDbService().checkRecent(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.data is String) {
            return Center(
              child: Text(snapshot.data),
            );
          } else {
            List<RecentModel> data = snapshot.data as List<RecentModel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].cbPrice.toString()),
                );
              },
              itemCount: data.length,
            );
          }
        });
  }
}
