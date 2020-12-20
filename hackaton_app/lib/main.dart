import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/UserLocal.dart';
import 'parts/rait.dart';
import 'parts/graph.dart';
import 'parts/partners.dart';
import 'parts/maps.dart';
import 'package:hackaton_app/parts/privalages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserLocal>(
      create: (context) => UserLocal(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: <Widget>[
                Rait(),
                Graph(),
                Privelages(),
                Partners(),
                Maps(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



