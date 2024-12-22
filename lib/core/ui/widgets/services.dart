import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/consts/consts.dart';
import 'package:kimberly/core/ui/widgets/area_card.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
    required this.constraints,
    this.crossAxisCount = 4,
  });

  final double constraints;
  final int crossAxisCount;

  List<AreaCard> get getItems => LandingPageConsts.getAreaCards(constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F9F9),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF4F8F8),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlignedGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemBuilder: (context, index) => getItems[index],
              itemCount: getItems.length,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 20,
                bottom: 10,
              ),
              child: Text(
                'Contato e localização',
                style: GoogleFonts.roboto(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
