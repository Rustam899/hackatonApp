import 'package:flutter/material.dart';
import 'package:hackaton_app/services/Map.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 14.0),
            ],
          ),
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 12.0),
        child: RaisedButton(onPressed: (){
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Map(),
            ),
          );
        },
        child:Text('Доступные для посещения места',style:TextStyle(color: Colors.white,fontSize: 24),textAlign: TextAlign.center,),
              color:Color.fromRGBO(5, 13, 124, 1) ,),
      )
    );
  }
}