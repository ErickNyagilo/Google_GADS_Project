import 'package:flutter/material.dart';
import 'package:google_project/pages/learning.dart';
import 'package:google_project/pages/skill.dart';
import 'package:google_project/pages/submit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('LEADERBOARD'),
            backgroundColor: Colors.black,
            actions: [
              Container(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Submit()));
                  },
                  child: Text("Submit"),
                ),
              )
            ],
            bottom: TabBar(indicatorColor: Colors.orange, tabs: [
              Tab(
                text: 'Learning Leaders',
              ),
              Tab(
                text: 'Skill IQ Leaders',
              )
            ]),
          ),
          body: TabBarView(children: [Learning(), Skill()]),
        ));
  }
}
