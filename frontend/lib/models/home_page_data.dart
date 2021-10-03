import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/models/project.dart';

class HomePageData {
  List<Group> groups = List.empty(growable: true);
  List<Project> projects = List.empty(growable: true);

  HomePageData.fromJson(jsonObject) {
    var groupData = jsonObject["groups"] ?? [];
    groupData.forEach((element) {
      groups.add(Group.fromJson(element));
    });

    var projectsData = jsonObject["projects"] ?? [];
    projectsData.forEach((element) {
      projects.add(Project.fromJson(element));
    });
  }
}