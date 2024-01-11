import 'package:ba_training/liton/colors.dart';
import 'package:flutter/material.dart';
class Liton_Home extends StatelessWidget {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.height;
    return Container(
      color: primary,
    );
  }
}
