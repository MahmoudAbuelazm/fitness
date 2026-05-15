import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fitness/features/home/presentation/widgets/macro_progress_bar.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/theme/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../widgets/action_card.dart';
import '../widgets/activity_unit.dart';
import '../widgets/current_status.dart';
import '../widgets/home_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentCalories = 1400;
  final totalCalories = 2500;
  final currentProtein = 85;
  final currentCarbs = 120;
  final currentFat = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h(context)),
              child: HomeTitle(),
            ),
            CurrentStatus(
              currentCalories: currentCalories,
              totalCalories: totalCalories,
            ),
            SizedBox(height: 24.h(context)),
            FadeInUp(
              duration: const Duration(milliseconds: 700),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
                      blurRadius: 15,
                      spreadRadius: -3,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
                      blurRadius: 15,
                      spreadRadius: -4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/daily_macros.svg'),
                        SizedBox(width: 6.w(context)),
                        Text(
                          'Daily Macros',
                          style: TextStyles.font18BlackW700Inter(
                            context,
                          ).copyWith(color: ColorsManagers.textDark),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h(context)),
                    MacroProgressBar(
                      title: 'Protein',
                      currentGrams: currentProtein,
                      totalGrams: 165,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 16.h(context)),
                    MacroProgressBar(
                      title: 'Carbs',
                      currentGrams: currentCarbs,
                      totalGrams: 200,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(height: 16.h(context)),
                    MacroProgressBar(
                      title: 'Fat',
                      currentGrams: currentFat,
                      totalGrams: 65,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h(context)),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Row(
                children: [
                  Expanded(
                    child: ActionCard(
                      title: "Add Meal",
                      subtitle: "Track your food",
                      icon: "assets/svgs/add_meal.svg",
                      color: ColorsManagers.neutralGreen,
                      onTap: () => context.pushNamed(Routes.nutrition),
                    ),
                  ),
                  SizedBox(width: 16.w(context)),
                  Expanded(
                    child: ActionCard(
                      title: "Log Workout",
                      subtitle: "Track exercises",
                      icon: "assets/svgs/log_workout.svg",
                      color: ColorsManagers.logWorkoutBorder,
                      onTap: () => context.pushNamed(Routes.workout),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h(context)),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 15,
                    spreadRadius: -3,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 15,
                    spreadRadius: -4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      "Today's Activity",
                      style: TextStyles.font18BlackW700Inter(context),
                    ),
                  ),
                  SizedBox(height: 20.h(context)),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActivityUnit(
                          value: "12",
                          label: "Exercises",
                          color: ColorsManagers.neutralGreen,
                        ),
                        ActivityUnit(
                          value: "45",
                          label: "Minutes",
                          color: ColorsManagers.logWorkoutBorder,
                        ),
                        ActivityUnit(
                          value: "6,847",
                          label: "Steps",
                          color: ColorsManagers.steps,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h(context)),
            FadeInUp(
              duration: const Duration(milliseconds: 1100),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsManagers.tdeeBorder.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ColorsManagers.tdeeBorder.withValues(alpha: .3),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorsManagers.tdeeBorder,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset('assets/svgs/tdee.svg'),
                    ),
                    SizedBox(width: 16.w(context)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TDEE Calculator",
                            style: TextStyles.font16MirageW600Inter(
                              context,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6.h(context)),
                          Text(
                            "Calculate your daily calorie needs",
                            style: TextStyles.font12GreyW400Inter(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
