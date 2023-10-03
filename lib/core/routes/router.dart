import 'package:go_router/go_router.dart';
import 'package:kimberly/modules/home/home_page.dart';
import 'package:kimberly/modules/splash/splash_page.dart';

enum Pages { home, splash }

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Pages.splash.name,
      builder: (context, state) {
        Future.delayed(const Duration(seconds: 2), () {
          context.goNamed('home');
        });

        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: Pages.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
