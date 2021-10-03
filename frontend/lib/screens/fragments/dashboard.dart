import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/services/data_loader.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomePageData?>(
      future: loadHomePageData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          return Center(child: Text("Data loaded!\nCreate UI to show the data!"));
        } else {
          return Center(child: Text("Data loading failed!"));
        }
      }
    );
  }
}
