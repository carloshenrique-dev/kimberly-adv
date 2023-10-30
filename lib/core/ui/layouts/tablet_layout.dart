import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/consts/consts.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

import '../widgets/kimberly_card.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({
    super.key,
  });

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Header(
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CardView(),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: Text(
                    'Áreas de atuação',
                    style: titleStyle,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: GridView.custom(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                pattern: [
                  const WovenGridTile(1.2),
                  const WovenGridTile(
                    1,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => LandingPageConsts.areaCards[index],
                childCount: LandingPageConsts.areaCards.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
