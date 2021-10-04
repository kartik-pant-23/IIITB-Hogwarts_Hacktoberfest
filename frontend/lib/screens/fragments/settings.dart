import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiitb_hogwarts/widgets/bottombutton.dart';
import 'package:iiitb_hogwarts/widgets/details_card.dart';
import 'package:iiitb_hogwarts/widgets/formfield.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = '';
  String email = '';
  String group = '';
  String groupIcon = '';
  String score = '';
  final List data = [
    {
      "user": {
        "name": "Test User",
        "email": "test@user.com",
        "group": {
          "_id": "61556b0643b3c71da2e11b17",
          "name": "Inventors",
          "tagline":
              "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
          "group_logo":
              "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"
        },
        "score": 10,
        "about": "Hi there! I am using IIITB Hogwarts.",
        "id_facebook": "",
        "id_instagram": "",
        "id_linkedin": "",
        "id_github": "",
        "id_twitter": "",
        "id_youtube": "",
        "id_personal": "",
        "_id": "615960791e2ef7e4c9e653d6",
        "createdAt": "2021-10-03T07:49:13.621Z",
        "updatedAt": "2021-10-03T07:49:13.621Z",
        "__v": 0
      }
    }
  ];
  @override
  void initState() {
    super.initState();
    name = data[0]['user']['name'];
    email = data[0]['user']['email'];
    groupIcon = data[0]['user']['group']['group_logo'];
    group = data[0]['user']['group']['name'];
    score = data[0]['user']['score'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailsCard(
              groupIcon: groupIcon,
              group: group,
              name: name,
              email: email,
              score: score,
            ),
            SizedBox(
              height: 10,
            ),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.infoCircle,
                  color: Colors.white,
                ),
                labelText: 'About',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                labelText: 'Facebook id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                labelText: 'Instagram id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                ),
                labelText: 'LinkedIn id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                ),
                labelText: 'Github id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                ),
                labelText: 'Twitter id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.youtube,
                  color: Colors.white,
                ),
                labelText: 'Youtube id',
                enabled: true),
            FormFieldWidget(
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                labelText: 'Personal id',
                enabled: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(text: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
