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
        fontSize: constraints != null ? 18 : 24,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: isMobile ? 14 : 18,
        color: const Color(0xFF474747),
        fontWeight: FontWeight.w400,
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
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: isMobile && lessThan500 ? 36 : 44,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: titleStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: isMobile ? 1 : 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: ((isMobile && !lessThan500) || !isMobile),
                child: Text(
                  description,
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
