import 'package:flutter/material.dart';

class Avater extends StatefulWidget {
  const Avater({super.key});

  @override
  State<Avater> createState() => _AvaterState();
}

class _AvaterState extends State<Avater> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyzQyiesjovetiwqwjWzss8ZX_baOSHBOiAgZsevkiBw&s'),
          ),
        ),
      ),
    );
  }
}
