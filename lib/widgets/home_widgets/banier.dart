import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Banier extends StatefulWidget {
  const Banier({super.key});

  @override
  State<Banier> createState() => _BanierState();
}

class _BanierState extends State<Banier> {
  List images = [
    "images/baniere/baniere_red.png",
    "images/baniere/baniere_green.png",
    "images/baniere/baniere_blue.png",
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: double.infinity,
              height: 140,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 140,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.ease,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        viewportFraction: 1,
      ),
    );
  }
}
