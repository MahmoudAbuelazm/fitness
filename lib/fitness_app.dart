import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness/core/routing/app_router.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/theme/colors.dart';

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
          seedColor: ColorsManagers.yankeesBlue,
          primary: ColorsManagers.yankeesBlue,
          secondary: ColorsManagers.ceil,
          tertiary: ColorsManagers.indianRed,
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: ColorsManagers.eerieBlack,
          displayColor: ColorsManagers.eerieBlack,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
