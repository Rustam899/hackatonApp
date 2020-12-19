import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:provider/provider.dart';
import 'components/card.dart';
import 'domain/UserLocal.dart';
import 'package:path_provider/path_provider.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Rait extends StatefulWidget {
  @override
  _RaitState createState() => _RaitState();
}

class _RaitState extends State<Rait> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Текущий рейтинг - ",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            Text(
              "7.9",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.9, 0.0),
          colors: [
            Color.fromRGBO(5, 13, 124, 1),
            Color.fromRGBO(82, 91, 215, 1),
          ],
        ),
      ),
    );
  }
}

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}
List<String> tmp;
var data=[0.0 , 3.5, 2.5 , 7.2, 8.9];

class _GraphState extends State<Graph> {
  var _localFileContent;
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    () async{
      var file= await _getLocalFile;
      
      if(file.existsSync())
      {
        this._readTextFromLocalFile();
        tmp=_localFileContent.split(' ');
        if(tmp[tmp.length-1]!=Provider.of<UserLocal>(context,listen:true).rait.toString())
        {
          _localFileContent+=" "+Provider.of<UserLocal>(context,listen:false).rait.toString();
        }
        this._writeTextToLocalFile(_localFileContent);
        data=_localFileContent.split(' ');
      }
      else
      {
        data=[0.0];
        double value=0.0;
        _writeTextToLocalFile(
          value.toString()
        );
      }
    };
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        alignment: Alignment.center,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 14.0),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Динамика рейтинга за весь период обучения',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(5, 13, 124, 1),
                ),
              ),
            ),
            /* Text(_localFileContent.toString()), */
            Padding(
              padding: EdgeInsets.all(12),
              child: new Sparkline(
                data: data,
                lineColor: Color.fromRGBO(5, 13, 124, 1),
                pointsMode: PointsMode.all,
                pointSize: 14,
                pointColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<String> get _getLocalPath async {
    final directory =await getApplicationDocumentsDirectory();
    return directory.path;
  }
  
  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/paitings.txt');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async{
    String content;
    try{
      final file = await _getLocalFile;
      content= await file.readAsString();
    }catch(e)
    {
      content= 'Error loading loacl file: $e';
    }

    setState(() {
      this._localFileContent=content;
    });
  }

}

class Privelages extends StatefulWidget {
  @override
  _PrivelagesState createState() => _PrivelagesState();
}

class _PrivelagesState extends State<Privelages> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Мои привилегии',
                  style: TextStyle(
                      color: Color.fromRGBO(5, 13, 124, 1), fontSize: 24),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: MyCard(
                              context.watch<UserLocal>().rait >= 8.0
                                  ? Color.fromRGBO(5, 13, 124, 1)
                                  : Colors.grey,
                              "Cкидка 3% на товары и услуги партеров.",
                              Icon(
                                Icons.money,
                                color: Colors.white,
                              ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                            context.watch<UserLocal>().rait >= 4.0
                                ? Color.fromRGBO(5, 13, 124, 1)
                                : Colors.grey,
                            "Оплата проезда в транспорте со скидкой.",
                            Icon(
                              Icons.car_rental,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                            context.watch<UserLocal>().rait >= 7.0
                                ? Color.fromRGBO(5, 13, 124, 1)
                                : Colors.grey,
                            "Кэшбэк банка на покупки у партнеров.",
                            Icon(
                              Icons.money,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 8.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Скидка на оплату за обучение в университете.",
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 14.0),
            ],
          ),
        ),
      ),
    );
  }
}

class Partners extends StatefulWidget {
  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Партнеры',
                  style: TextStyle(
                      color: Color.fromRGBO(5, 13, 124, 1), fontSize: 24),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 14.0),
            ],
          ),
        ),
      ),
    );
  }
}
