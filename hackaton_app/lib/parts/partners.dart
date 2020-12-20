import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hackaton_app/domain/UserLocal.dart';
import 'package:hackaton_app/components/card.dart';

class Partners extends StatefulWidget {
  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0,bottom:24),
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 2.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Партнер 1",
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 6.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Партнер 2",
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 6.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Образовательная программа 1",
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 4.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Онлайн-курсы",
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 5.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Мед. учереждение 1",
                          Icon(
                            Icons.medical_services,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 6.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Мед. учереждение 2",
                          Icon(
                            Icons.medical_services,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 5.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Интернет магазин",
                          Icon(
                            Icons.store,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 6.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Онлайн-сервисы",
                          Icon(
                            Icons.online_prediction,
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