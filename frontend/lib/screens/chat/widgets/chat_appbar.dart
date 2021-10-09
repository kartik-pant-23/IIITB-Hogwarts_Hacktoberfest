import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/constants/palette.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;

  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(
        color: Palette.primaryTextColor,
        fontSize: 20); // Text style for the name
    var textStyle = TextStyle(
        color: Palette.secondaryTextColor); // Text style for everything else

    double width =
        MediaQuery.of(context).size.width; // calculate the screen width
    return Material(
        child: Container(
            decoration: new BoxDecoration(boxShadow: [
              //adds a shadow to the appbar
              new BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              )
            ]),
            child: Container(
                color: Palette.accentColor,
                child: Row(children: <Widget>[
                  Expanded(
                      //we're dividing the appbar into 7 : 3 ratio. 7 is for content and 3 is for the display picture.
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('<Group Name Here>', style: textHeading),
                                  Text('<Group Tagline Here>', style: textStyle)
                                ],
                              )),
                          //second row containing the buttons for media
                          Container(
                              height: 23,
                              padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Messages',
                                    style: textStyle,
                                  ),
                                  VerticalDivider(
                                    width: 30,
                                    color: Palette.primaryTextColor,
                                  ),
                                  Text(
                                    'Attachments',
                                    style: textStyle,
                                  ),
                                  // VerticalDivider(
                                  //   width: 30,
                                  //   color: Palette.primaryTextColor,
                                  // ),
                                  // Text('Files', style: textStyle)
                                ],
                              )),
                        ],
                      )),
                  //This is the display picture
                  Expanded(
                      flex: 3,
                      child: Container(
                          child: Center(
                              child: CircleAvatar(
                        radius: (80 - (width * .06)) / 2,
                        backgroundImage:
                            Image.asset("images/ic_default_profile.svg").image,
                      )))),
                ]))));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
