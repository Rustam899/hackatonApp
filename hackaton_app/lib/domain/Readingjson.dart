import 'package:flutter/material.dart';
import 'package:hackaton_app/domain/UserLocal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show utf8;

import 'package:provider/provider.dart';

//класс, соответсвующий объекту из бд
class User {
  final String fio, university_name, card_num, stud_num, marks;
  final int student_id, achievements;

  User(
      {this.student_id,
      this.fio,
      this.university_name,
      this.card_num,
      this.stud_num,
      this.marks,
      this.achievements});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        student_id: json["student_id"],
        fio: json["fio"],
        university_name: json["university_name"],
        card_num: json["card_num"],
        stud_num: json["stud_num"],
        marks: json["marks"],
        achievements: json["achievements"]);
  }
}

List<User> stud = [];

class TopTravelers extends StatefulWidget {
  const TopTravelers({Key key, int state}) : super(key: key);

  @override
  _TopTravelersState createState() => _TopTravelersState();
}

bool canRequest = true;

class _TopTravelersState extends State<TopTravelers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: obtainJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return;
        });
  }

  Future<List<User>> obtainJson() async {
    if (canRequest) {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await http.get(
          'https://vtd-back.herokuapp.com/' +
              Provider.of<UserLocal>(context, listen: true).univer,
          headers: headers);

      dynamic jsonObject = convert.jsonDecode(utf8.decode(response.bodyBytes));

      jsonObject.forEach((elem) {
        stud += [User.fromJson(elem)];
      });
      canRequest = false;
    }
  }
}
