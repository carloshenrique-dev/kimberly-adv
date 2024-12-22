import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/ui/widgets/academic_timeline.dart';
import 'package:kimberly/core/ui/widgets/work_timeline.dart';

import 'swiper.dart';

class AboutKimberly extends StatelessWidget {
  final double constraints;
  const AboutKimberly({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Kimberly De Médici Varanda',
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                DefaultTextStyle(
                  style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'OAB/SP: 412.748',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Biografia',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: (constraints < 850) ? constraints - 100 : 400,
                  child: Text(
                    "Seguindo suas aspirações com fé em Deus, aos 23 anos Kimberly de Médici Varanda realizou seu sonho e da sua família de se formar em Direito.Com uma educação ímpar e dedicada de seus pais aprendeu desde cedo a importância do trabalho justo e honesto. Nascida em Jundiaí, morou em Ribeirão Preto até seus 10 anos de idade e desde então e atualmente reside em Itupeva onde se arriscou a abrir seu escritório e tem conquistado espaço e notoriedade no município. Anteriormente adquiriu experiência na procuradoria do Município de Itupeva e no Procon da cidade. Recentemente atuou no Direito Eleitoral nas eleições de 2020. Dedicada e comprometida com seus clientes e assistidos da Defensoria Pública, defende o Direito e justiça até o fim, sempre valoriza a importância da família e a proteção da mulher e menores em seus processos. Atua por amor à profissão e os clientes se somam entre os satisfeitos.",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Visibility(
              visible: constraints > 850,
              child: const PhotoSwiper(),
            ),
          ],
        ),
        Visibility(
          visible: constraints <= 850,
          child: const PhotoSwiper(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 50, right: 150, top: 20),
          child: WorkTimeline(),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: 1000,
          child: AcademicTimeline(),
        ),
      ],
    );
  }
}
