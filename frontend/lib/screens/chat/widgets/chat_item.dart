import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/constants/palette.dart';
import 'package:iiitb_hogwarts/models/chat_head.dart';
import 'package:intl/intl.dart';

class ChatItemWidget extends StatelessWidget {
  ChatItemWidget({required this.chatHead, required this.userId});

  var userId;
  ChatHead chatHead;

  List<Icon> icons = [
    Icon(
      Icons.check,
      color: CupertinoColors.systemGrey,
    ),
    Icon(
      Icons.done,
      color: Colors.grey,
    ),
    Icon(
      Icons.check,
      color: Colors.lightBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (chatHead.senderId == userId) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return Container(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                chatHead.msg!, //'This is a sent message',
                style: TextStyle(color: Palette.selfMessageColor),
              ),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              width: 200.0,
              decoration: BoxDecoration(
                  color: Palette.selfMessageBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )),
              margin: EdgeInsets.only(right: 10.0),
            )
          ],
          mainAxisAlignment:
              MainAxisAlignment.end, // aligns the chatitem to right end
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            child: Text(
              DateFormat('dd MMM kk:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      int.tryParse(chatHead.timestamp!)!)),
              style: TextStyle(
                  color: Palette.greyColor,
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal),
            ),
            margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
          ),
          Container(
            child: chatHead.isDelivered!
                ? chatHead.isSeen!
                    ? icons[2]
                    : icons[1]
                : icons[0],
          )
        ])
      ]));
    } else {
      // This is a received message
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    chatHead.msg!, //'This is a received message',
                    style: TextStyle(color: Palette.otherMessageColor),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Palette.otherMessageBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      )),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            ),
            Container(
              child: Text(
                DateFormat('dd MMM kk:mm').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.tryParse(chatHead.timestamp!)!)),
                style: TextStyle(
                    color: Palette.greyColor,
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal),
              ),
              margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }
}
