import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hackaton_app/domain/UserLocal.dart';

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
              Provider.of<UserLocal>(context,listen:true).rait.toString(),
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