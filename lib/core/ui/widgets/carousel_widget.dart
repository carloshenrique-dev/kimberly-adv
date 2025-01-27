import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kimberly/core/repositories/links_repository_impl.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselWidget extends StatefulWidget {
  final bool isMobile;

  const CarouselWidget({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late final LinksRepositoryImpl _linksRepository;
  Map<String, dynamic> links = {};

  Future<void> getLinks() async {
    try {
      final result = await _linksRepository.getLinks();
      setState(() {
        links = result;
      });
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
    }
  }

  @override
  initState() {
    super.initState();
    _linksRepository = LinksRepositoryImpl();
    getLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.isMobile ? 2 : 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4,
              ),
              itemCount: links.length,
              itemBuilder: (_, index) {
                final title = links.keys.elementAt(index);
                final website = Uri.parse(links[title]!);
                return InkWell(
                  onTap: () async {
                    if (await canLaunchUrl(website)) {
                      await launchUrl(website);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
