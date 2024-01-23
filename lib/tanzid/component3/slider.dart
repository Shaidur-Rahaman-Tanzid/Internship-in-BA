import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slider_button/slider_button.dart';
//import 'package:screen_brightness_control/screen_brightness_control.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({super.key});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  final Img = [
    'assets/images/Screenshot 2023-03-07 114133.png',
    'assets/images/Screenshot 2023-03-14 104853.png'
  ];
  double _value = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
              itemCount: Img.length,
              itemBuilder: (context, Index, realIndex) {
                final AssetImage = Img[Index];
                return buildImage(AssetImage, Index);
              },
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: false,
              )),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Brightness'),
          ),
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.black,
            value: _value.toDouble(),
            onChanged: (double newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          Center(
              child: SliderButton(
            action: () async {
              ///Do something here
              Navigator.pop(context);
              return false;
            },
            highlightedColor: Colors.red,
            label: const Text(
              "Slide to cancel Event",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: const Center(
                child: Icon(
              CupertinoIcons.power,
              color: Colors.redAccent,
              size: 30.0,
              //semanticLabel: 'Text to announce in accessibility modes',
            )),
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
            ),
          )),
          const SizedBox(height: 20),
          // Center(
          //   child: SliderButton(
          //     action: () async {
          //       Navigator.pop(context);
          //     },
          //     label: const Text(
          //       "Slide  Event",
          //       style: TextStyle(
          //           color: Color(0xff4a4a4a),
          //           fontWeight: FontWeight.w500,
          //           fontSize: 17),
          //     ),
          //     highlightedColor: Colors.red,

          //   ),
          // )
        ],
      ),
    );
  }
}

Widget buildImage(String Img, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        Img,
        fit: BoxFit.cover,
      ),
    );
