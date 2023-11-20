import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../models/steps.dart' as step;

List<step.Step> _generateData() {
  return <step.Step>[
    const step.Step(
      step: 1,
      title: '2020 - Atual: Advogada Eleitoral',
      message:
          'Assessoria eleitoral a partidos do Município de Itupeva.\nRealização de defesas em procedimentos de candidatura, obtenção de certidões de objeto e pé, recursos eleitorais, prestações de contas com candidatos, fiscalização no dia das eleições, orientações acerca das propagandas eleitorais, entre outros procedimentos necessários no âmbito eleitoral.',
    ),
    const step.Step(
      step: 2,
      title: '2019 - Atual: Advogada Em Escritório Próprio',
      message:
          'Advogada e fundadora do escritório, atuante em áreas cíveis trabalhistas, previdenciárias, direito do consumidor, tributárias, ambientais, eleitorais, digitais e empresariais.',
    ),
    const step.Step(
      step: 3,
      title: '2019 - Atual: Defensoria Pública Municipal (Itupeva)',
      message:
          'Atuação em processos cíveis voltados para a área de Família e Sucessões.',
    ),
    const step.Step(
      step: 4,
      title: '2017: Estágio No Procon De Itupeva',
      message:
          'Abertura de reclamações (CIP), tentativa de acordos e obtenção de êxito em sua grande maioria, tratativa via telefone, carta e email, atendimento ao público, acompanhamento de audiências, realização de cursos de formação no Procon em São Paulo.',
    ),
    const step.Step(
      step: 5,
      title: '2016-2017: Estágio na Prefeitura De Itupeva',
      message:
          'Cargas processuais, peticionamentos e protocolos em geral, minutas, pareceres, organização processual para procuradora, vivência nos procedimentos dos processos do Ministério Público, processos trabalhistas, Tribunal de Contas, Cíveis e Mandados de Segurança, tendo a Municipalidade como parte Requerente ou Requerida. Acompanhamento de audiências trabalhistas.',
    ),
  ];
}

class WorkTimeline extends StatelessWidget {
  const WorkTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Histórico Profissional',
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _generateData().length,
          itemBuilder: (context, index) {
            final item = _generateData()[index];
            return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.1,
              isFirst: index == 0 ? true : false,
              isLast: item == _generateData().last,
              indicatorStyle: const IndicatorStyle(
                width: 20,
                color: Color(0xFFCB8421),
                padding: EdgeInsets.all(6),
              ),
              endChild: _RightChild(
                title: item.title,
                message: item.message,
                disabled: true,
              ),
              beforeLineStyle: const LineStyle(
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    //required this.icon,
    required this.title,
    required this.message,
    this.disabled = false,
  });

  //final IconData icon;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 229, 229, 229),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
