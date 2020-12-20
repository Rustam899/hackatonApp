import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserLocal with ChangeNotifier
{
  double _rait=5.9;
  double get rait => _rait;
  set setRait(double value)  {
    _rait=value;
    notifyListeners();
  } 
}