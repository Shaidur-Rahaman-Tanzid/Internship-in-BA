import 'dart:async';

import 'package:flutter/material.dart';

class stream_builder2 extends StatefulWidget {
  const stream_builder2({super.key});

  @override
  State<stream_builder2> createState() => _stream_builder2State();
}

class _stream_builder2State extends State<stream_builder2> {
  int counter = 0;
  StreamController<int> countercontroller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder(
            stream: countercontroller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                );
              } else {
                return const Text('0',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
              }
            }),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter++;
            countercontroller.sink.add(counter);
          },
          child: const Icon(Icons.add)),
    );
  }
}
