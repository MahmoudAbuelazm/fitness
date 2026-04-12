import 'package:flutter/material.dart';
import 'package:fitness/features/home/ui/screens/home_screen.dart';
import 'package:fitness/features/nutrition/ui/screens/nutrition_screen.dart';
import 'package:fitness/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:fitness/features/splash/ui/screens/splash_screen.dart';
import 'package:fitness/core/routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.nutrition:
        return MaterialPageRoute(builder: (_) => const NutritionScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
