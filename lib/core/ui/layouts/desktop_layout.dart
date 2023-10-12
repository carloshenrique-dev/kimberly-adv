import 'package:flutter/material.dart';
import 'package:kimberly/core/ui/widgets/header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Header(
              fit: BoxFit.fitWidth,
              height: 650,
            ),
          ],
        ),
      ),
    );
  }
}
