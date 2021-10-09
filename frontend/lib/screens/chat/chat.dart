import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/screens/chat/widgets/data.dart';
import 'package:iiitb_hogwarts/widgets/transition.dart';

import 'chat_screen.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...chatData
              .map((e) => GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(SlideLeftRoute(widget: UserChatScreen())),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 22.0,
                              backgroundImage:
                                  NetworkImage(e['image_url'].toString()),
                            ),
                            title: Row(
                              children: [
                                Text(e['group_name'].toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("( ${e['group_score'].toString()}+ )"),
                              ],
                            ),
                            subtitle: Text(
                              "${e['last_user']}: ${e['last_msg']}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Column(
                              children: [
                                const Icon(Icons.people),
                                Text(e['numOfMembers'].toString())
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
