import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_project/utils/constants.dart';
import 'package:google_project/utils/podo.dart';
import 'package:http/http.dart' as http;

class Skill extends StatefulWidget {
  Skill({Key key}) : super(key: key);

  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  List<SkillCoverter> leaders = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchSkills();
  }

  Future fetchSkills() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(SystemUtils().baseUrl + "/skilliq",
        headers: {'accept': 'application/json'});
    var jsonResponse = json.decode(response.body);

    var list = jsonResponse.map((m) => SkillCoverter.fromJson(m)).toList();

    getskills(list);
  }

  getskills(var list) {
    leaders.clear();
    list.forEach((item) {
      setState(() {
        leaders.add(item);

        leaders.sort((a, b) {
          return a.score.compareTo(b.score);
        });
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              reverse: true,
              itemCount: leaders == null ? 0 : leaders.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(leaders[index].badgeurl),
                    ),
                    title: Text(leaders[index].name),
                    subtitle: Text(leaders[index].score.toString() +
                        " skill IQ score , " +
                        leaders[index].country),
                  ),
                );
              }),
    );
  }
}
