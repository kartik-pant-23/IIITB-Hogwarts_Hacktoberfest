import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/chat_head.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/screens/chat/widgets/chat_appbar.dart';
import 'package:iiitb_hogwarts/screens/chat/widgets/chat_item.dart';
import 'package:iiitb_hogwarts/screens/chat/widgets/input.dart';
import 'package:iiitb_hogwarts/services/chat.dart';
import 'package:provider/provider.dart';

class UserChatScreen extends StatefulWidget {
  final String? groupId;

  const UserChatScreen({Key? key, this.groupId}) : super(key: key);

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(), // Custom app bar for chat screen
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ChatListWidget(), //
              // Chat list
              InputWidget() // The input widget
            ],
          ),
        ],
      ),
    );
  }
}

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context, listen: false);
    return StreamBuilder<List<ChatHead>>(
        // get all messages from given group id as List of <ChatHeads>
        stream: ChatServices().getChatsByGroupId(groupid: "GROUP_ID"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          return Flexible(
              child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) => ChatItemWidget(
              chatHead: snapshot.data![index],
              userId: '182ae4e0-e24f-4597-b232-016b823009ed'//"USER_ID",
            ),
            itemCount: 20,
            reverse: true,
            controller: listScrollController,
          ));
        });
  }
}
