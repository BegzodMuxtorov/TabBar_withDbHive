// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   TabController? tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber.shade200,
//         title: Text(
//           "Tab Bar",
//           style: TextStyle(
//               color: Colors.black87,
//               fontSize: 25,
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.bold),
//         ),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: [
//             Tab(text: 'Phone',),,
//             Tab(text: 'Desktop'),
//              Tab(text: 'Accesuar'),
//           ] ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           Container(
//             color: Colors.blue,
//           ),
//           Container(
//             color: Colors.red,
//           ),
//           Container(
//             color: Colors.brown,
//           ),

//         ]),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tabbar/view/categories/contacts_catagery.dart';
import 'package:tabbar/view/categories/favorite_catagery.dart';
import 'package:tabbar/view/categories/recents_catagery.dart';
import 'package:tabbar/view/categories/voicemail_catagery.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30.0,
        backgroundColor: Colors.grey.shade700,
        title: Text(
          'TabBar',
          style: TextStyle(fontSize: 25),
        ),
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            icon: Icon(Icons.star),
            text: 'Favorites',
          ),
          Tab(
            icon: Icon(Icons.watch_later_rounded),
            text: 'Recents',
          ),
          Tab(
            icon: Icon(Icons.person_pin),
            text: 'Contacts',
          ),
          Tab(
            icon: Icon(Icons.voicemail_rounded),
            text: 'Voicemail',
          )
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: _categories,
      ),
    );
  }

  final List<Widget> _categories = [
    const Favorite(),
    const Recents(),
    const Contacts(),
    const Voicemail()
  ];
}
