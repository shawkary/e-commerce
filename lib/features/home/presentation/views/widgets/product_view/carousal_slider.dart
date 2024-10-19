import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/Banners.dart';


class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider(this.banner, {super.key});
  final List<Banners> banner;

  @override
  Widget build(BuildContext context) {
      return CarouselSlider(
            options: CarouselOptions(
              height: 220.0,
              autoPlay: true,
              viewportFraction: 1,
            ),
            items: banner.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedNetworkImage(
                    imageUrl: i.image!,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator())
                  );
                },
              );
            }).toList(),
          );
  }
}
