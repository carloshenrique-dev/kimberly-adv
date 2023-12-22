import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.fit,
    this.height,
    required this.logoSize,
    this.isMobile = false,
  });

  final BoxFit fit;
  final double? height;
  final bool isMobile;
  final double logoSize;

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: isMobile ? 30 : 45,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fitHeight,
            height: logoSize,
            width: logoSize,
            filterQuality: FilterQuality.high,
          ),
        ),
        Container(
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
                    maxLines: isMobile ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
