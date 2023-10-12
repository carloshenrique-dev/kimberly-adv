import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaCard extends StatelessWidget {
  final String title;
  final String description;

  const AreaCard({
    super.key,
    required this.title,
    required this.description,
  });

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 450,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
