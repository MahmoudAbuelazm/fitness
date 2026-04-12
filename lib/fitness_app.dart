import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness/core/routing/app_router.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/theming/colors.dart';

class FitnessApp extends StatelessWidget {
  final AppRouter appRouter;
  
  const FitnessApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.primary,
          primary: ColorsManager.primary,
          secondary: ColorsManager.secondary,
          tertiary: ColorsManager.tertiary,
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: ColorsManager.textDark,
          displayColor: ColorsManager.textDark,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
