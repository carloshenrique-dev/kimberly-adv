import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/consts/consts.dart';
import 'package:kimberly/core/ui/widgets/carousel_widget.dart';
import 'package:kimberly/core/ui/widgets/contact_form.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

import '../widgets/about_kimberly.dart';

class DesktopLayout extends StatelessWidget {
  final Map<String, dynamic> links;
  final double constraints;

  const DesktopLayout({
    super.key,
    required this.links,
    required this.constraints,
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
                  fit: BoxFit.fitWidth,
                  height: 650,
                  logoSize: 170,
                ),
                AboutKimberly(
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselWidget(
                  links: links,
                ),
                const SizedBox(
                  height: 20,
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
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) =>
                  LandingPageConsts.getAreaCards(null)[index],
              itemCount: LandingPageConsts.getAreaCards(null).length,
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
