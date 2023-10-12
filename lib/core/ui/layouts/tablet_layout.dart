import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kimberly/core/ui/widgets/header.dart';
import 'package:kimberly/core/ui/widgets/services_section.dart';

class TabletLayout extends StatelessWidget {
  final double maxWidth;

  const TabletLayout({
    super.key,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Header(
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (_, __, index) {
                    return const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),
              ServicesSection(maxWidth: maxWidth),
            ],
          ),
        ),
      ),
    );
  }
}
