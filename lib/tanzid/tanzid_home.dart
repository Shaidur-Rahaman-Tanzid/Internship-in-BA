//import 'dart:js';
import 'package:ba_training/tanzid/Dropdown.dart';
import 'package:ba_training/tanzid/Stream_builder2.dart';
import 'package:ba_training/tanzid/dio_req.dart';
import 'package:ba_training/tanzid/future_builder.dart';
import 'package:ba_training/tanzid/stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'futureBuilder.dart';

class Tanzid_Home extends StatelessWidget {
  var size, height, width;

  void _showdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alart Dialog box'),
            content: Text('Are you sure'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Day 5 works'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 125, 180),
      ),
      body: Container(
        // decoration: BoxDecoration(border: Border.all(width: 2)),
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _btn('Custom functions', () {}),
              _btn('Dropdown With search', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dropdown(),
                    ));
              }),
              _btn('Alart dialog', () {
                _showdialog(context);
              }),
              _btn('Url Launcher', () {
                const link = 'https://pub.dev/packages/url_launcher';
                launchUrl(Uri.parse(link),
                    mode: LaunchMode.externalApplication);
              }),
              _btn('Circular prgress', () {}),
              _btn('Future Builder', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Future_builder()));
              }),
              _btn('Stream Builder', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => stream_builder()));
              }),
              _btn('Stream Builder2', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => stream_builder2()));
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _btn('Circular Avater', () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Avater()));
                  }),
                  // const CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       'https://img.freepik.com/free-photo/tropical-macaw-perched-vibrant-feathers-focus-generated-by-ai_188544-9720.jpg?w=740&t=st=1704883482~exp=1704884082~hmac=7b997822b530ac12c82bd178e837197ca7962fafe3edbec69d2efbbd10e5a4fb'),
                  // ),
                ],
              ),
              _btn('Dio', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dio_req()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _btn(String btnname, VoidCallback path) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: path,
      child: Text(
        btnname,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[500], elevation: 3),
    ),
  );
}
