import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class PhotoSwiper extends StatelessWidget {
  const PhotoSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: true,
      duration: 2,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            LandingPageConsts.images[index],
            height: 600,
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: LandingPageConsts.images.length,
      itemWidth: 300.0,
      itemHeight: 600,
      layout: SwiperLayout.TINDER,
    );
  }
}
