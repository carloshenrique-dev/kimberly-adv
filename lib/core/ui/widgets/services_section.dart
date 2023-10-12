import 'package:flutter/material.dart';
import 'package:kimberly/core/ui/widgets/area_card.dart';

class ServicesSection extends StatelessWidget {
  final double maxWidth;

  const ServicesSection({
    super.key,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    print(maxWidth);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: maxWidth < 650 ? 15 : 80,
                  ),
                  child: const AreaCard(
                    title: 'Ambiental',
                    description:
                        'Tratativas nas fases dos processos de licenciamento ambiental.',
                  ),
                ),
              ),
              /*SizedBox(
                width: 10,
              ),
              Flexible(
                child: AreaCard(
                  title: 'Cível',
                  description:
                      'Direito do consumidor e ações cíveis de indenização, família e inventários.',
                ),
              ),*/
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: maxWidth < 650 ? 15 : 80,
                  ),
                  child: const AreaCard(
                    title: 'Digital',
                    description:
                        'Temas no âmbito digital como: Contratos, crimes cibernétios e responsabilidade civil na internet.',
                  ),
                ),
              ),

              /*SizedBox(
                width: 10,
              ),
              Flexible(
                child: AreaCard(
                  title: 'Eleitoral',
                  description:
                      'Assessoramento partidário, elaboração de pareceres e consultas, defesas e impugnações de candidatos, partidos e coligações perante a Justiça Eleitoral.',
                ),
              ),*/
            ],
          ),
          const Row(
            children: [
              Flexible(
                  child: AreaCard(
                title: 'Empresarial',
                description:
                    'Elaboração, revisão e negociação de contratos comerciais e financeiros.',
              )),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: AreaCard(
                  title: 'Imobiliário',
                  description:
                      'Estruturação de negócios e impreendimentos imobiliários, elaboração e revisão de contratos de compra e venda, pareceres e ações relacionadas ao direito imobiliário.',
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Flexible(
                child: AreaCard(
                  title: 'Ambiental',
                  description:
                      'Tratativas nas fases dos processos de licenciamento ambiental.',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: AreaCard(
                  title: 'Cível',
                  description:
                      'Direito do consumidor e ações cíveis de indenização, família e inventários.',
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Flexible(
                child: AreaCard(
                  title: 'Previdenciário',
                  description:
                      'Concessão e revisão de benefícios de aposentadorias e pensões, restabelecimento de benefícios de auxílio-doença, acidentários e cálculos previdenciários.',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: AreaCard(
                  title: 'Trabalhista',
                  description:
                      'Aconselhamento e representação em demandas trabalhistas, revisões legais de estruturas de salários e benefícios (saldo de FGTS).',
                ),
              ),
            ],
          ),
          const Center(
            child: AreaCard(
              title: 'Tributário',
              description:
                  'Suporte nas soluções e possíveis reduções das cargas tributárias (contencioso e consultivo).',
            ),
          ),
        ],
      ),
    );
  }
}
