import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/ui/widgets/contact_form.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

import '../widgets/about_kimberly_mobile.dart';
import '../widgets/services.dart';

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
                    'Áreas de atuação',
                    style: titleStyle,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Services(
              constraints: constraints,
              crossAxisCount: 2,
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
