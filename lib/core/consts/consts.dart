import 'package:flutter/material.dart';
import 'package:kimberly/core/ui/widgets/area_card.dart';

sealed class LandingPageConsts {
  static final List<AreaCard> areaCards = getAreaCards(null);

  static List<AreaCard> getAreaCards(double? constraints) {
    return [
      AreaCard(
        title: 'Ambiental',
        description:
            'Assistência nas fases do licenciamento ambiental, incluindo análise de impacto ambiental, consultoria em normativas e regulamentações, e estratégias de mitigação de impacto ambiental.',
        icon: Icons.forest,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Cível',
        description:
            'Direito do consumidor, ações cíveis de indenização, família, inventários, e mediação de conflitos familiares. Oferecemos suporte jurídico em questões contratuais e representação legal em casos de danos pessoais e propriedade.',
        icon: Icons.gavel,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Digital',
        description:
            'Questões no âmbito digital, abrangendo contratos eletrônicos, crimes cibernéticos, proteção de dados, e responsabilidade civil na internet. Auxiliamos na elaboração de termos de uso, políticas de privacidade, e representação legal em casos de violação de direitos digitais.',
        icon: Icons.computer,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Eleitoral',
        description:
            'Assessoramento partidário, elaboração de pareceres e consultas jurídicas em questões eleitorais, defesas e impugnações de candidatos, partidos políticos e coligações perante a Justiça Eleitoral. Garantimos conformidade com a legislação eleitoral vigente.',
        icon: Icons.how_to_vote,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Empresarial',
        description:
            'Elaboração, revisão e negociação de contratos comerciais e financeiros. Oferecemos consultoria jurídica para empreendimentos empresariais, fusões e aquisições, além de representação em litígios comerciais.',
        icon: Icons.business,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Imobiliário',
        description:
            'Estruturação de negócios e empreendimentos imobiliários, elaboração e revisão de contratos de compra e venda, pareceres legais, e ações relacionadas ao direito imobiliário. Garantimos a segurança jurídica em transações imobiliárias.',
        icon: Icons.home,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Previdenciário',
        description:
            'Concessão e revisão de benefícios de aposentadorias e pensões, restabelecimento de benefícios de auxílio-doença, acidentários e cálculos previdenciários. Oferecemos suporte legal para garantir seus direitos previdenciários.',
        icon: Icons.account_balance,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Trabalhista',
        description:
            'Aconselhamento e representação em demandas trabalhistas, revisões legais de estruturas de salários e benefícios (saldo de FGTS). Garantimos a conformidade com a legislação trabalhista e defendemos seus interesses trabalhistas.',
        icon: Icons.work,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Tributário',
        description:
            'Suporte abrangente para planejamento tributário, redução da carga tributária e resolução de questões relacionadas a impostos, tanto em contextos contenciosos quanto consultivos. Defendemos seus interesses em litígios fiscais e tributários.',
        icon: Icons.attach_money,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Direito Canábico',
        description:
            'Oferecemos assessoria jurídica especializada, incluindo serviços de consultoria, habeas corpus e ações públicas relacionadas ao uso e regulamentação de cannabis. Atuamos para garantir seus direitos dentro da legislação vigente.',
        icon: Icons.eco,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Mediação judicial\ne extrajudicial',
        description:
            'Assessoria, acompanhamento de acordos, implementação de composição pré processo e no decorrer do processo, utilização de humanização e pacificação. Facilitamos a resolução de conflitos de forma eficiente e amigável.',
        icon: Icons.handshake,
        constraints: constraints,
      ),
      AreaCard(
        title: 'Direito Contratual',
        description:
            'Oferecemos serviços abrangentes, incluindo a elaboração e revisão detalhada de contratos em diversas modalidades, garantindo segurança jurídica em todas as suas transações comerciais e contratuais.',
        icon: Icons.edit_document,
        constraints: constraints,
      ),
    ];
  }

  static List<String> get images {
    return [
      'assets/pose_1.jpeg',
      'assets/pose_2.jpeg',
      'assets/pose_3.jpeg',
      'assets/pose_4.jpeg',
    ];
  }
}
