import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:provider/provider.dart';
import 'package:hackaton_app/domain/UserLocal.dart';
import 'package:path_provider/path_provider.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}
List<String> tmp;
List<double> data=[0.0];

class _GraphState extends State<Graph> {
  var _localFileContent;
  @override 
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        alignment: Alignment.center,
        height: 225,
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
            RaisedButton(child:Text('Показать',style:TextStyle(color: Colors.white,fontSize: 24),),
            color:Color.fromRGBO(5, 13, 124, 1) ,
            onPressed: ()=>
            setState(()async {
            var file= await _getLocalFile;  
            if (file.existsSync())
            {
              await this._readTextFromLocalFile();
              tmp=_localFileContent.split(' ');
              if(tmp[tmp.length-1]!=Provider.of<UserLocal>(context,listen:false).rait.toString())
              {
                   _localFileContent+=" "+Provider.of<UserLocal>(context,listen:false).rait.toString();
                   await this._writeTextToLocalFile(_localFileContent);
                   tmp=_localFileContent.split(' ');
                   data.clear();
                   data.length=tmp.length;
                   for (int i=0;i<tmp.length;i++)
                   {
                   data[i]=double.tryParse(tmp[i]);
                   }
                 
              }
              else
              {
                 tmp=_localFileContent.split(' ');
                 data.clear();
                 data.length=tmp.length;
                 for (int i=0;i<tmp.length;i++)
                 {
                   data[i]=double.tryParse(tmp[i]);
                 }
              }
            }
            else
            {
              data=[0.0];
              await this._writeTextToLocalFile("0.0");
              await this._readTextFromLocalFile();
            }
            }),
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
    return File('$path/myraitings.txt');
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