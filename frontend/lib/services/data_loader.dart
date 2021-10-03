import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iiitb_hogwarts/models/home_page_data.dart';

import '../important_strings.dart';

Future<HomePageData?> loadHomePageData() async {
  try {
    Uri api = Uri.http(BASE_URL, HOME);
    http.Response response = await http.get(api);
    if(response.statusCode != 200) {
      print("HomePageDataLoadingError : ${response.body}");
      return null;
    }
    print(response.body);
    return HomePageData.fromJson(jsonDecode(response.body));
  } catch(err) {
    print("HomePageDataLoadingException : ${err.toString()}");
    return null;
  }
}