import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final double? constraints;

  const AreaCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.constraints,
  });

  TextStyle get titleStyle => GoogleFonts.roboto(
        fontSize: constraints != null ? 20 : 28,
        color: Colors.black,
        fontWeight: isMobile ? FontWeight.normal : FontWeight.bold,
      );

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: isMobile ? 16 : 22,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  bool get lessThan500 {
    if (constraints != null && constraints! < 500) {
      return true;
    } else {
      return false;
    }
  }

  bool get isMobile {
    if (constraints != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: isMobile && lessThan500
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: isMobile && lessThan500 ? 40 : 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: isMobile ? 1 : 2,
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: ((isMobile && !lessThan500) || !isMobile),
                child: Flexible(
                  child: Text(
                    description,
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
