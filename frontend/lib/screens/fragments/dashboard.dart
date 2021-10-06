import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/services/data_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data = {
    "message": "Data loaded!",
    "groups": [
      {
        "_id": "61556b0643b3c71da2e11b17",
        "name": "Inventors",
        "numOfMembers": 0,
        "tagline":
            "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
        "group_score": 0,
        "group_logo":
            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg"
      },
      {
        "_id": "61556d0a43b3c71da2e11b18",
        "name": "Decoders",
        "numOfMembers": 0,
        "tagline":
            "The truth. It is a beautiful and terrible thing, and should therefore be treated with great caution.",
        "group_score": 0,
        "group_logo":
            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/decoders_logo.jpg"
      },
      {
        "_id": "61556dd643b3c71da2e11b19",
        "name": "Nerdz",
        "numOfMembers": 0,
        "tagline":
            "It is our choices, that show what we truly are, far more than our abilities.",
        "group_score": 0,
        "group_logo":
            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/nerdz_logo.jpg"
      },
      {
        "numOfMembers": 0,
        "_id": "6155708143b3c71da2e11b1b",
        "name": "Techlers",
        "umOfMembers": 0,
        "tagline":
            "Hearing voices no one else can hear isn’t a good sign, even in the wizarding world.",
        "group_score": 0,
        "group_logo":
            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/techlers_logo.jpg"
      }
    ],
    "projects": [
      {
        "_id": "6156c790f72d3fb2bb7420b0",
        "project_url": "https://github.com/space-voyager-21/space-voyager",
        "project_title": "Space Voyager",
        "banner_url":
            "https://user-images.githubusercontent.com/79041510/134652654-3e9c740c-3b67-4a52-8809-0760c9c55364.png",
        "author_year": "2nd Year",
        "author_uid": {
          "_id": "6156c6f930999ea64222e308",
          "name": "Mohit Khairnar"
        },
        "__v": 0
      },
      {
        "_id": "6156c8a1dd04fbbd21fa2622",
        "project_url": "https://github.com/akk312000/Movie-Recommender",
        "project_title": "Movie Recommender",
        "banner_url":
            "https://analyticsindiamag.com/wp-content/uploads/2020/08/stars-movies-1200x670-1.jpg",
        "author_year": "3rd Year",
        "author_uid": {
          "_id": "6156c82ddd04fbbd21fa261f",
          "name": "Ashish Kashyap"
        },
        "__v": 0
      },
      {
        "_id": "6156c8fbdd04fbbd21fa2624",
        "project_url": "https://github.com/kartik-pant-23/IIITB-Hogwarts",
        "project_title": "IIITB-Hogwarts",
        "banner_url":
            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/inventors_logo.jpg",
        "author_year": "3rd Year",
        "author_uid": {
          "_id": "6156b4fcbee30d1ffb3a8088",
          "name": "Kartik Pant"
        },
        "__v": 0
      }
    ]
  };
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List groupsActive = data['groups'] as List;
    List projectsPresent = data["projects"] as List;
    return FutureBuilder<HomePageData?>(
        //   future: loadHomePageData(),
        builder: (context, snapshot) {
      //Code to be used while fetching data online
      // if (snapshot.connectionState == ConnectionState.waiting) {
      //   return Center(child: CircularProgressIndicator());
      // } else if
      // (snapshot.hasData && snapshot.data != null
      // ) {
      //   return Center(
      //       child: Text("Data loaded!\nCreate UI to show the data!"));
      // } else {
      //   return Center(child: Text("Data loading failed!"));
      // }
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...groupsActive
                .map((e) => Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 22.0,
                              backgroundImage: NetworkImage(e['group_logo']),
                            ),
                            title: Row(
                              children: [
                                Text(e['name']),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("( ${e['group_score'].toString()}+ )"),
                              ],
                            ),
                            subtitle: Text(
                              e['tagline'],
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
                    ))
                .toList(),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(48, 25, 52, 1),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: projectsPresent.length,
                  itemBuilder: (ctx, index) {
                    return SingleChildScrollView(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Color.fromRGBO(48, 25, 52, 1),
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _launchInBrowser(
                                        projectsPresent[index]['project_url']);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.47,
                                      child: Image(
                                        filterQuality: FilterQuality.high,
                                        image: NetworkImage(
                                            projectsPresent[index]
                                                ['banner_url']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.purpleAccent,
                                    backgroundImage: NetworkImage(
                                        'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png'),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        projectsPresent[index]['project_title'],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                          'Created By : ${projectsPresent[index]['author_uid']['name']}'),
                                      Text(
                                          ' A ${projectsPresent[index]['author_year']} Student')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
