import 'package:flutter/material.dart';

class Future_builder extends StatefulWidget {
  const Future_builder({super.key});

  @override
  State<Future_builder> createState() => _Future_builderState();
}

class _Future_builderState extends State<Future_builder> {
  Future<String> getData() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    return "Congratulations";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(snapshot.data.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Refresh'),
                  )),
            ],
          );
        }
      },
    ));
  }
}
