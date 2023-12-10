import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kimberly/core/utils/get_initials.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselWidget extends StatelessWidget {
  final Map<String, dynamic> links;
  final bool isMobile;

  const CarouselWidget({
    super.key,
    required this.links,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CarouselSlider.builder(
        itemCount: links.length,
        itemBuilder: (_, value, index) {
          final title = links.keys.elementAt(value);
          final website = Uri.parse(links[title]);
          return InkWell(
            onTap: () async {
              if (await canLaunchUrl(website)) {
                await launchUrl(website);
              }
            },
            child: Container(
              width: isMobile ? 200 : 300,
              height: isMobile ? 80 : 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.black,
                        child: Text(
                          getInitials(title),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
