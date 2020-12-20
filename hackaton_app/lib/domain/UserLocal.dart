import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert' show utf8;

class UserLocal with ChangeNotifier {
  double _rait = 5.9;
  String _name = "Дундуков Михаил Юрьевич";
  String _univer = "yargu";
  String get name => _name;
  String get univer => _univer;
  double get rait => _rait;
  set setRait(double value) {
    _rait = value;
    notifyListeners();
  }
}
