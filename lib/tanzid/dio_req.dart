import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio_req extends StatefulWidget {
  const dio_req({super.key});

  @override
  State<dio_req> createState() => _dio_reqState();
}

class _dio_reqState extends State<dio_req> {
  // var x = '0';
  var x;
  var dio = Dio();
  Future fetchData() async {
    var responce =
        await dio.get('https://jsonplaceholder.typicode.com/todos/2');
    print("Res" + responce.statusCode.toString());

    if (responce.statusCode == 200) {
      x = responce.data;
      setState(() {});
    } else {
      print(responce.statusCode);
    }
  }

  Future<List?>? _getDio() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(x['title']),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  fetchData();
                  // x = fetchData() as String;
                },
                child: const Text('Fatch Data')),
          ),
          // Text(x),
        ],
      ),
    );
  }
}
