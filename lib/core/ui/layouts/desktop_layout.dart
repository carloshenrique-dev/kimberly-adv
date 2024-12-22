import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/ui/widgets/contact_form.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

import '../widgets/about_kimberly.dart';
import '../widgets/services.dart';

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
                    'Áreas de atuação',
                    style: titleStyle,
                  ),
                ),
                Services(
                  constraints: constraints,
                ),
              ],
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
