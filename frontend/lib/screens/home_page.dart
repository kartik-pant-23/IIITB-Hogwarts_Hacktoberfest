import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/screens/chat/chat.dart';
import 'package:iiitb_hogwarts/screens/fragments/dashboard.dart';
import 'package:iiitb_hogwarts/screens/fragments/settings.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> fragments = [
    Dashboard(), ChatMainScreen(), Settings()
  ];

  final List<String> fragmentTitles = [
    'Dashboard',
    'Group Chat',
    'Settings'
  ];

  final List<IconData> fragmentIcons = [
    Icons.dashboard,
    Icons.group,
    Icons.settings
  ];

  final Color primary = Color(0xFF480945),
      accent = Color(0xFFDF267C);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedFragment = 0;
  late StreamController<int> tabController;
  late Stream<int> tabs;

  @override
  void initState() {
    tabController = StreamController();
    tabs = tabController.stream.asBroadcastStream();
    tabController.add(0);
    super.initState();
  }

  @override
  void dispose() {
    tabController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget drawerTile({required int index}) {
      return StreamBuilder(
        stream: tabs,
        initialData: selectedFragment,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              selectedFragment = index;
              tabController.add(selectedFragment);
              Navigator.of(context).pop();
            },
            child: ListTile(
                selected: index == selectedFragment,
                tileColor: primary,
                selectedTileColor: accent,
                title: Text(
                  fragmentTitles[index],
                  style: TextStyle(color: Colors.white),
                ),
                leading: (index == 7)
                    ? Image.asset('images/ic_foreground.png', height: 24, width: 24)
                    : Icon(fragmentIcons[index], color: Colors.white)
            ),
          );
        }
      );
    }

    Widget drawer() {
      return Drawer(
        child: SafeArea(
          child: Container(
            color: Color(0xFF480945),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/ic_foreground.png',
                              width: 32, height: 32),
                          SizedBox(width: 12),
                          Text(
                            'IIITB Hogwarts',
                            textScaleFactor: 1.8,
                          )
                        ],
                      ),
                    ),
                    Divider(
                        color: Theme
                            .of(context)
                            .colorScheme.secondary
                            .withOpacity(0.5)),
                    SizedBox(height: 6),
                    drawerTile(index: 0),
                    drawerTile(index: 1),
                    drawerTile(index: 2),
                    GestureDetector(
                      onTap: () {

                      },
                      child: ListTile(
                        tileColor: primary,
                        title: Text(
                          'Sign Out',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading:
                        Icon(Icons.logout, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Future<bool> onBackPressed() async {
      if (selectedFragment != 0) {
        selectedFragment = 0;
        tabController.add(selectedFragment);
        return false;
      }
      return showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                backgroundColor: Color(0xFF480945),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 24),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/ic_foreground.png',
                        width: 32, height: 32),
                    SizedBox(width: 12),
                    Text(
                      'IIITB Hogwarts',
                      textScaleFactor: 1.4,
                    )
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(color: Theme
                        .of(context)
                        .colorScheme.secondary
                        .withOpacity(0.5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Is that it.. You want to exit the app?'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('NO')
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('YES')
                  ),
                ],
              )) as Future<bool>;
    }

    return WillPopScope(
      onWillPop: onBackPressed,
      child: StreamBuilder<int>(
        stream: tabs,
        builder: (context, snapshot) {
          int index = (snapshot.hasData) ? snapshot.data! : 0;
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                elevation: 4,
                backgroundColor: Color(0xFF480945),
                title: Text(fragmentTitles[index]),
                centerTitle: true,
                leading: IconButton(
                  icon: Image.asset(
                    'images/ic_drawer.png', height: 24, width: 24,),
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                ),
              ),
              drawer: drawer(),
              body: fragments[index]
          );
        }
      )
    );
  }
}