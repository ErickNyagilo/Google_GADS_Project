import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_project/utils/constants.dart';
import 'package:google_project/utils/podo.dart';
import 'package:http/http.dart' as http;

class Learning extends StatefulWidget {
  Learning({Key key}) : super(key: key);

  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  List<LearnerCoverter> learners = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchLearners();
  }

  Future fetchLearners() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(SystemUtils().baseUrl + "/hours",
        headers: {'accept': 'application/json'});
    var jsonResponse = json.decode(response.body);

    var list = jsonResponse.map((m) => LearnerCoverter.fromJson(m)).toList();

    getLearners(list);
  }

  getLearners(var list) {
    learners.clear();
    list.forEach((item) {
      setState(() {
        learners.add(item);

        learners.sort((a, b) {
          return a.hours.compareTo(b.hours);
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
              itemCount: learners == null ? 0 : learners.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(learners[index].badgeurl),
                    ),
                    title: Text(learners[index].name),
                    subtitle: Text(learners[index].hours.toString() +
                        " learning hours , " +
                        learners[index].country),
                  ),
                );
              }),
    );
  }
}
