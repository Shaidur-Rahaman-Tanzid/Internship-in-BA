import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio_req extends StatefulWidget {
  const dio_req({super.key});

  @override
  State<dio_req> createState() => _dio_reqState();
}

class _dio_reqState extends State<dio_req> {
  // var x = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchData();
                // x = fetchData() as String;
              },
              child: const Text('Fatch Data')),
          // Text(x),
        ],
      ),
    );
  }
}

Future fetchData() async {
  var dio = Dio();
  var responce = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
  print(responce.statusCode);
  print(responce.data.toString());
}
