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
  final LinksRepository _linksRepository = LinksRepositoryImpl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _linksRepository.getLinks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Layout para dispositivos móveis
                  return MobileLayout(
                    links: snapshot.data!,
                    constraints: constraints.maxWidth,
                  );
                } else if (constraints.maxWidth >= 600 &&
                    constraints.maxWidth < 1024) {
                  // Layout para tablets
                  return TabletLayout(
                    links: snapshot.data!,
                    constraints: constraints.maxWidth,
                  );
                } else {
                  // Layout para desktop
                  return DesktopLayout(
                    links: snapshot.data!,
                    constraints: constraints.maxWidth,
                  );
                }
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
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
