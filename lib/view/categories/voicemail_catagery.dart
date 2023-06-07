import 'package:flutter/material.dart';
import 'package:tabbar/service/tabbar_service.dart';

class Voicemail extends StatelessWidget {
  const Voicemail({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TabBarService().getVoicemailData(),
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
        return Text(
          "Voicemail",
          style: TextStyle(
              color: Colors.white70, fontSize: 60,
               fontWeight: FontWeight.bold,

               ),
        );
      }
    });
  }
}
