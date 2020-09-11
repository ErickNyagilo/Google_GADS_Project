import 'package:flutter/material.dart';
import 'package:google_project/pages/mainpage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Top Learner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Container(
          child: new SplashScreen(
              seconds: 3,
              navigateAfterSeconds: new HomePage(),
              image: Image.asset('lib/asset/mainlogo.jpeg'),
              backgroundColor: Colors.black,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              loaderColor: Colors.red),
        ));
  }
}
