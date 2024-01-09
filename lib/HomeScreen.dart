import 'package:ba_training/akhirul/akhirul.dart';
import 'package:ba_training/liton/liton_home.dart';
import 'package:ba_training/sakib/sakib_home.dart';
import 'package:ba_training/tanzid/tanzid_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('BA Training'),
            backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            children: [
              TabBar(
                  tabs: [
                    Tab(
                      text: 'LITON',
                    ),
                    Tab(
                      text: 'TANZID',
                    ),
                    Tab(
                      text: 'SAKIB',
                    ),
                    Tab(
                      text: 'AKHIRUL',
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  Liton_Home(),
                  Tanzid_Home(),
                  Sakib_Home(),
                  Akhirul_Home(),
                ]),
              )
            ],
          ),
        ));
  }
}
