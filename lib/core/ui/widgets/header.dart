import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.fit,
    this.height,
  });

  final BoxFit fit;
  final double? height;

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: 45,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(
            'assets/first.jpg',
          ),
          opacity: 0.65,
          fit: fit,
        ),
      ),
      height: height ?? 450,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Soluções jurídicas sólidas, compromisso inabalável.\nSeu sucesso é nossa missão.',
                style: textStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
