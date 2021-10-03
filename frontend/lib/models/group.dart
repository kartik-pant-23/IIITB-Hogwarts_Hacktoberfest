import 'package:iiitb_hogwarts/models/user.dart';

class Group {

  late String id, name, groupLogo, tagline;
  int groupScore = 0, numOfMembers = 0;
  List<User> members = List.empty();

  Group.fromJson(jsonObject) {
    this.id = jsonObject['_id'];
    this.name = jsonObject['name'];
    this.groupLogo = jsonObject['group_logo'];
    this.tagline = jsonObject['tagline'];
    this.groupScore = jsonObject['group_score'];
    this.numOfMembers = jsonObject['numOfMembers'];
  }

}