import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/repositories/links_repository.dart';
import 'package:kimberly/core/repositories/links_repository_impl.dart';
import 'package:kimberly/core/ui/layouts/export_layouts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LinksRepository _linksRepository;
  Map<String, dynamic> _links = {};

  @override
  void initState() {
    _linksRepository = LinksRepositoryImpl();
    _getLinks();
    super.initState();
  }

  Future<void> _getLinks() async {
    _links = await _linksRepository.getLinks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Layout para dispositivos móveis
            return MobileLayout(
              links: _links,
              constraints: constraints.maxWidth,
            );
          } else if (constraints.maxWidth >= 600 &&
              constraints.maxWidth < 1024) {
            // Layout para tablets
            return TabletLayout(
              links: _links,
              constraints: constraints.maxWidth,
            );
          } else {
            // Layout para desktop
            return DesktopLayout(
              links: _links,
              constraints: constraints.maxWidth,
            );
          }
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(right: 9.0),
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.green[600],
              backgroundColor: Colors.green[600],
            ),
            onPressed: () async {
              final Uri url = Uri.parse(
                  'https://web.whatsapp.com/send?phone=5511983175559&text=Ol%C3%A1!%20Eu%20gostaria%20de%20uma%20orienta%C3%A7%C3%A3o.');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            icon: SvgPicture.asset(
              'assets/whatsapp.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: Text(
              'Fale conosco!',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
