import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Kimberly De Médici Varanda\n",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          "OAB/SP: 412.748",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Vida Acadêmica",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "2013-2017: Formada Bacharel em Direito no Centro Universitário Padre Anchieta.\n\n2017: Certificação em Direito do Consumidor pelo Procon\n\n2018: Curso de Pericia Criminal: Locais de crimes e análises de vestigios pelo Instituto Helix.\n\n2020-2022: Pos graduada em Direito Eleitoral nu instituição Damásio Educacional\n\n2021: Colunista no site Portal de Notícias\n\n2021: Compõe como advogada a JARI de Itupeva.\n\n2021: Escritora livro 'Me refiz em textos'\n\n2021: Auxiliar da justiça (inventariante dativo, liquidante e administradora de falências e recuperações)\n\n2021: Parceria com detetive particular\n\n2021: Certificada em Advocacy-Escola Aberta Terceiro Setor\n\n2022: Pós Graduação Direito Tributário APET.",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Biografia",
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
          width: 750,
          child: Text(
            "Seguindo suas aspirações com fé em Deus, aos 23 anos Kimberly de Médici Varanda realizou seu sonho e da sua família de se formar em Direito.Com uma educação ímpar e dedicada de seus pais aprendeu desde cedo a importância do trabalho justo e honesto. Nascida em Jundiaí, morou em Ribeirão Preto até seus 10 anos de idade e desde então e atualmente reside em Itupeva onde se arriscou a abrir seu escritório e tem conquistado espaço e notoriedade no município. Anteriormente adquiriu experiência na procuradoria do Município de Itupeva e no Procon da cidade. Recentemente atuou no Direito Eleitoral nas eleições de 2020. Dedicada e comprometida com seus clientes e assistidos da Defensoria Pública, defende o Direito e justiça até o fim, sempre valoriza a importância da família e a proteção da mulher e menores em seus processos. Atua por amor à profissão e os clientes se somam entre os satisfeitos.",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Histórico Profissional",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 750,
          child: Text(
            "2020 - Atual: Advogada Eleitoral\n\nAssessoria eleitoral a partidos do Municipio de Itupeva.\n\nRealização de defesas procedimentos de candidatura, obtenção de certidões de objeto e pé, recursos eleitorais, prestações de contas cos candidatos, fiscalização no dia das eleições, orientaches acerca das propagandas eleitoraia, entre demais procedimentos necessarios no ambito eleitoral\n\n2019 - Atual: Advogada Em Escritório Próprio\n\nAdvogada e fundadora do escritório, atuante em áreas civeis trabalhistas, previdenciárias, direito do consumidor, tributárias, ambientais, eleitorais, digitais e empresariais.\n\n2019 - Atual: Defensoria Pública Municipal (Itupeva)\nAtuação em processos cíveis voltados para a área de Familis e Sucessões\n\n2017: Estágio No Procon De Itupeva\n\nAbertura de reclamações (CIP), tentativa de acordos e obtenção de éxito em sua grande maioria, tratativa via telefone, corta e email atendimento ao público, acompanhamento de audiências, realização de cursa ce formação Procon em São Paulo\n\n2016-2017: Estágio na Prefeitura De Itupeva\nCargas processuais, peticionamentos e protocolos em geral minutes, pareceres organização processuais para procuradora, vivência nos procedimentos dos processos do Ministério Público processos trabalhistas, Tribunal de Contas, Civeis e Mandados de Seguranças tendo a Municipalidade como parte Requerente ou Requerida. Acompanhamentos de audiências trabalhistas.",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
