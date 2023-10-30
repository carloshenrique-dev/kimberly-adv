import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const AreaCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  description,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
