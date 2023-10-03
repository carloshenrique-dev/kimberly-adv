import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  TextStyle get textStyle => GoogleFonts.roboto(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/first.jpg',
                ),
                opacity: 0.65,
                fit: BoxFit.cover,
              ),
            ),
            height: 450,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Soluções jurídicas sólidas, compromisso inabalável. Seu sucesso é nossa missão.',
                      style: textStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
