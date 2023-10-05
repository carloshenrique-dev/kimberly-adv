import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/ui/widgets/area_card.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (_, __, index) {
                    return const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0, // Altura do carrossel
                    autoPlay: true, // Reprodução automática
                    enlargeCenterPage: true, // Ampliar a página central
                    aspectRatio: 16 / 9, // Proporção da imagem
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
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
                    Row(
                      children: [
                        Flexible(
                          child: AreaCard(
                            title: 'Digital',
                            description:
                                'Temas no âmbito digital como: Contratos, crimes cibernétios e responsabilidade civil na internet.',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: AreaCard(
                            title: 'Eleitoral',
                            description:
                                'Assessoramento partidário, elaboração de pareceres e consultas, defesas e impugnações de candidatos, partidos e coligações perante a Justiça Eleitoral.',
                          ),
                        ),
                      ],
                    ),
                    Row(
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
                    Row(
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
                    Row(
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
                    Center(
                      child: AreaCard(
                        title: 'Tributário',
                        description:
                            'Suporte nas soluções e possíveis reduções das cargas tributárias (contencioso e consultivo).',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
