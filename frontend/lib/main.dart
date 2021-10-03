import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/screens/login_page.dart';
import 'package:iiitb_hogwarts/services/user.dart';
import 'package:iiitb_hogwarts/widgets/splash_screen.dart';
import 'package:iiitb_hogwarts/widgets/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(HogwartsApp());
}

class HogwartsApp extends StatelessWidget {
  const HogwartsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/background.jpg"), context);
    return Provider(
      create: (context) => User(),
      builder: (context, _) {
        User user = Provider.of<User>(context, listen: false);
        return MaterialApp(
          title: "IIITB Hogwarts",
          debugShowCheckedModeBanner: true,
          theme: ourTheme(),
          home: FutureBuilder<bool>(
            future: userLoginStatus(user),
            builder: (_, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting)
                return SplashScreen();
              else if (snapshot.data ?? false)
                return HomePage();
              else
                return LoginPage();
            }
          ),
        );
      }
    );
  }
}
