import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  Color color;
  String text;
  Icon icon;
  MyCard(this.color, this.text,this.icon);
  @override
  _CardState createState() => _CardState(color, text,icon);
}

class _CardState extends State<MyCard> {
  Color _color;
  String _text;
  Icon _icon;
  _CardState(this._color, this._text,this._icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex:2,
              child: Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  _text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          Expanded(child: Container(child: _icon)),
        ],
      ),
      decoration:
          BoxDecoration(color: _color, borderRadius: BorderRadius.circular(12)),
    );
  }
}
