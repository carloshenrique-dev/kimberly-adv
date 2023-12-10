import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../models/steps.dart' as step;

class AcademicTimeline extends StatelessWidget {
  final bool isMobile;

  const AcademicTimeline({
    super.key,
    this.isMobile = false,
  });

  List<step.Step> _generateData() {
    return <step.Step>[
      const step.Step(
        step: 1,
        title:
            '2013-2017: Formada Bacharel em Direito no Centro Universitário Padre Anchieta.',
        message: '',
      ),
      const step.Step(
        step: 2,
        title: '2017: Certificação em Direito do Consumidor pelo Procon.',
        message: '',
      ),
      const step.Step(
        step: 3,
        title:
            '2018: Curso de Perícia Criminal: Locais de crimes e análises de vestígios pelo Instituto Helix.',
        message: '',
      ),
      const step.Step(
        step: 4,
        title:
            '2020-2022: Pós-graduada em Direito Eleitoral na instituição Damásio Educacional.',
        message: '',
      ),
      const step.Step(
        step: 5,
        title: '2021: Colunista no site Portal de Notícias.',
        message: '',
      ),
      const step.Step(
        step: 6,
        title: '2021: Compõe como advogada a JARI de Itupeva.',
        message: '',
      ),
      const step.Step(
        step: 7,
        title: "2021: Escritora do livro 'Me refiz em textos'.",
        message: '',
      ),
      const step.Step(
        step: 8,
        title:
            '2021: Auxiliar da justiça (inventariante dativo, liquidante e administradora de falências e recuperações).',
        message: '',
      ),
      const step.Step(
        step: 9,
        title: '2021: Parceria com detetive particular.',
        message: '',
      ),
      const step.Step(
        step: 10,
        title: '2021: Certificada em Advocacy-Escola Aberta Terceiro Setor.',
        message: '',
      ),
      const step.Step(
        step: 11,
        title: '2022: Pós-graduação em Direito Tributário na APET.',
        message: '',
      ),
      const step.Step(
        step: 12,
        title:
            '2021-2023: Membro da JARI do municipio julgando as multas de trânsito da cidade',
        message: '',
      ),
      const step.Step(
        step: 13,
        title:
            '2023: Membro efetivo da comissão da OAB em Direito eleitoral e Direito desportivo',
        message: '',
      ),
      const step.Step(
        step: 14,
        title:
            '2023-2024: Curso de conciliação e mediação judicial na MediatoEduca',
        message: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Vida acadêmica',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: max(0, _generateData().length * 2 - 1),
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd) {
              return const TimelineDivider(
                color: Color(0xFFCB8421),
                thickness: 5,
                begin: 0.1,
                end: 0.9,
              );
            }

            final int itemIndex = index ~/ 2;

            final step = _generateData()[itemIndex];

            final bool isLeftAlign = itemIndex.isEven;

            final child = _AcademicTimelineChild(
              title: step.title,
              subtitle: step.message,
              isLeftAlign: isLeftAlign,
              isMobile: isMobile,
            );

            final isFirst = itemIndex == 0;
            final isLast = itemIndex == _generateData().length - 1;
            double indicatorY;
            if (isFirst) {
              indicatorY = 0.2;
            } else if (isLast) {
              indicatorY = 0.8;
            } else {
              indicatorY = 0.5;
            }

            return TimelineTile(
              alignment: TimelineAlign.manual,
              endChild: isLeftAlign ? child : null,
              startChild: isLeftAlign ? null : child,
              lineXY: isLeftAlign ? 0.1 : 0.9,
              isFirst: isFirst,
              isLast: isLast,
              indicatorStyle: IndicatorStyle(
                width: 40,
                height: 40,
                indicatorXY: indicatorY,
                indicator: _TimelineStepIndicator(step: '${step.step}'),
              ),
              beforeLineStyle: const LineStyle(
                color: Color(0xFFCB8421),
                thickness: 5,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({required this.step});

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFCB8421),
      ),
      child: Center(
        child: Text(
          step,
          style: GoogleFonts.roboto(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _AcademicTimelineChild extends StatelessWidget {
  const _AcademicTimelineChild({
    required this.title,
    required this.subtitle,
    required this.isLeftAlign,
    this.isMobile = false,
  });

  final String title;
  final String subtitle;
  final bool isLeftAlign;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
            isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
              fontWeight: isMobile ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
