import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/constants/palette.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          // Material(
          //   child: new Container(
          //     margin: new EdgeInsets.symmetric(horizontal: 1.0),
          //     child: new IconButton(
          //       icon: new Icon(Icons.face), onPressed: () {
          //         //todo
          //       // popup sticker here
          //     },
          //       color: Palette.primaryColor,
          //     ),
          //   ),
          //   color: Colors.white,
          // ),

          // Text input
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(color: Palette.primaryColor, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Palette.greyColor),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: new IconButton(
                icon: new Icon(
                  Icons.send,
                ),
                onPressed: () => {
                  // todo
                  // send message on click function
                },
                color: Palette.accentColor,
              ),
            ),
            color: Colors.transparent,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Palette.greyColor, width: 0.5)),
          // color: Colors.white
      ),
    );
  }
}
