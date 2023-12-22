import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/consts/consts.dart';
import 'package:kimberly/core/ui/widgets/carousel_widget.dart';
import 'package:kimberly/core/ui/widgets/contact_form.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

import '../widgets/about_kimberly_mobile.dart';

class MobileLayout extends StatelessWidget {
  final Map<String, dynamic> links;
  final double constraints;

  const MobileLayout({
    super.key,
    required this.links,
    required this.constraints,
  });

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: 25,
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
                  isMobile: true,
                  logoSize: 100,
                ),
                AboutKimberlyMobile(
                  constraints: constraints,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: Text(
                    'Parceiros e clientes',
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselWidget(
                  links: links,
                  isMobile: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: Text(
                    'Áreas de atuação',
                    style: titleStyle,
                    textAlign: TextAlign.center,
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
                  const WovenGridTile(1.1),
                  const WovenGridTile(
                    1,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) =>
                    LandingPageConsts.getAreaCards(constraints)[index],
                childCount: LandingPageConsts.getAreaCards(constraints).length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContactForm(
              constraints: constraints,
            ),
          )
        ],
      ),
    );
  }
}
