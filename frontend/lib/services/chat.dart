import 'package:iiitb_hogwarts/models/chat_head.dart';
import 'package:iiitb_hogwarts/screens/chat/widgets/data.dart';

class ChatServices {
  ///CHATS
//set chat services here
  Stream<List<ChatHead>> getChatsByGroupId({var groupid}) => (() async* {
        // here get chat of any particular group by its id
    // and return after parsing it into list of ChatHead objects
        await Future<void>.delayed(Duration(seconds: 2));
        yield chats.map((e) => ChatHead.fromJson(e)).toList();
      })();
}
