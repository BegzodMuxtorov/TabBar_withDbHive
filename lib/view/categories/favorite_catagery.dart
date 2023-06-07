import 'package:flutter/material.dart';
import 'package:tabbar/db/favorite_db.dart';
import 'package:tabbar/models/favorite_model.dart';
import 'package:tabbar/service/tabbar_service.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FavoriteDBService().checkFavorite(),
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
            List<Favoritemodel> data = snapshot.data as List<Favoritemodel>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].phone.toString()),
                );
              },
              itemCount: data.length,
            );
          }
        });
  }
}
