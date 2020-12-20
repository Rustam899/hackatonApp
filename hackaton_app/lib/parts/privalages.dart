import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hackaton_app/domain/UserLocal.dart';
import 'package:hackaton_app/components/card.dart';

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
                              context.watch<UserLocal>().rait >= 3.0
                                  ? Color.fromRGBO(5, 13, 124, 1)
                                  : Colors.grey,
                              "Cкидка ${(context.watch<UserLocal>().rait/2).round()}% на товары и услуги партеров.",
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
                            context.watch<UserLocal>().rait >= 3.0
                                ? Color.fromRGBO(5, 13, 124, 1)
                                : Colors.grey,
                            "Кэшбэк банка ${(context.watch<UserLocal>().rait/2).round()}% на покупки у партнеров.",
                            Icon(
                              Icons.money,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 6.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Скидка на оплату за обучение в университете.",
                          Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MyCard(
                          context.watch<UserLocal>().rait >= 3.0
                              ? Color.fromRGBO(5, 13, 124, 1)
                              : Colors.grey,
                          "Скидка на образовательные программы и курсы партнеров.",
                          Icon(
                            Icons.school,
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
                          "Скидка на посещение мед. учереждений-партнеров.",
                          Icon(
                            Icons.medical_services,
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