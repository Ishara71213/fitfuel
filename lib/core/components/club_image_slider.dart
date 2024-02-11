import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitfuel/core/components/club_hero_image.dart';
import 'package:flutter/material.dart';

class ClubImageSlider extends StatefulWidget {
  const ClubImageSlider({super.key, required this.imageUrlList});

  final List<String> imageUrlList;

  @override
  State<ClubImageSlider> createState() => _ClubImageSliderState();
}

class _ClubImageSliderState extends State<ClubImageSlider> {
  late List<ClubHeroImage> imageWidgetList;

  @override
  void initState() {
    super.initState();
    imageWidgetList =
        widget.imageUrlList.map((e) => ClubHeroImage(imageUrl: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imageWidgetList,
        options: CarouselOptions(
          height: 160,
          //aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 16),
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
