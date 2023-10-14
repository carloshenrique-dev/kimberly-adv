import 'package:flutter/material.dart';
import 'package:kimberly/core/ui/layouts/export_layouts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Layout para dispositivos móveis
            return const MobileLayout();
          } else if (constraints.maxWidth >= 600 &&
              constraints.maxWidth < 1024) {
            // Layout para tablets
            return const TabletLayout();
          } else {
            // Layout para desktop
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}
