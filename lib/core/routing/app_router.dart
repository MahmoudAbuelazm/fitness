import 'package:flutter/material.dart';
import 'package:fitness/features/nutrition/presentation/screens/nutrition_screen.dart';
import 'package:fitness/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:fitness/features/goal_questionnaire/presentation/screens/goal_selection_screen.dart';
import 'package:fitness/features/goal_questionnaire/presentation/screens/user_details_screen.dart';
import 'package:fitness/features/workout/presentation/screens/workout_screen.dart';
import 'package:fitness/core/routing/routes.dart';

import '../../features/main/presentation/screens/main_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.goalSelection:
        return MaterialPageRoute(builder: (_) => const GoalSelectionScreen());
      case Routes.userDetails:
        return MaterialPageRoute(
          builder: (_) => UserInfoScreen(goal: settings.arguments as GoalType),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.nutrition:
        return MaterialPageRoute(builder: (_) => const NutritionScreen());
      case Routes.workout:
        return MaterialPageRoute(builder: (_) => const WorkoutScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
