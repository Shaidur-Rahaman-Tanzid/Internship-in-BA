import 'package:flutter/material.dart';

class stream_builder extends StatefulWidget {
  const stream_builder({super.key});

  @override
  State<stream_builder> createState() => _stream_builderState();
}

Stream<int> generateStream = (() async* {
  await Future<void>.delayed(const Duration(seconds: 2));
  yield 1;

  await Future<void>.delayed(const Duration(seconds: 2));
  yield 2;
  //throw 'An Error Occure';
  await Future<void>.delayed(const Duration(seconds: 2));
  yield 3;
})();

class _stream_builderState extends State<stream_builder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: generateStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 30),
            );
          }
        },
      ),
    );
  }
}
