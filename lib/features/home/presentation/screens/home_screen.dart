import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fitness/features/home/presentation/widgets/calorie_ring.dart';
import 'package:fitness/features/home/presentation/widgets/macro_progress_bar.dart';
import 'package:fitness/features/home/logic/home_cubit.dart';
import 'package:fitness/features/home/logic/home_state.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/theme/styles.dart';

import '../widgets/action_card.dart';
import '../widgets/activity_unit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fitness',
                                style: TextStyles.font24BlackW700Inter(context),
                              ),
                              SizedBox(height: 4.h(context)),
                              Text(
                                'Sunday, April 10',
                                style: TextStyles.font14GreyW400Inter(context),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            child: Text(
                              'FN',
                              style: TextStyles.font16WhiteW700Inter(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            CalorieRing(
                              currentCalories: state.currentCalories,
                              totalCalories: state.totalCalories,
                              size: 200,
                            ),
                            SizedBox(height: 32.h(context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _StatColumn(title: 'Goal', value: '${state.totalCalories}'),
                                _StatColumn(
                                  title: 'Consumed', 
                                  value: '${state.currentCalories}', 
                                  color: Theme.of(context).colorScheme.primary
                                ),
                                _StatColumn(title: 'Burned', value: '420'),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.pie_chart_outline, color: Theme.of(context).colorScheme.secondary),
                                SizedBox(width: 8.w(context)),
                                Text(
                                  'Daily Macros',
                                  style: TextStyles.font18BlackW700Inter(context),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h(context)),
                            MacroProgressBar(
                              title: 'Protein',
                              currentGrams: state.currentProtein,
                              totalGrams: 165,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(height: 16.h(context)),
                            MacroProgressBar(
                              title: 'Carbs',
                              currentGrams: state.currentCarbs,
                              totalGrams: 200,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(height: 16.h(context)),
                            MacroProgressBar(
                              title: 'Fat',
                              currentGrams: state.currentFat,
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
                              icon: Icons.restaurant_menu_outlined,
                              color: Colors.green.shade50,
                              iconColor: Colors.green,
                              onTap: () => context.pushNamed(Routes.nutrition),
                            ),
                          ),
                          SizedBox(width: 16.w(context)),
                          Expanded(
                            child: ActionCard(
                              title: "Log Workout",
                              subtitle: "Track exercises",
                              icon: Icons.fitness_center_outlined,
                              color: Colors.blue.shade50,
                              iconColor: Colors.blue,
                              onTap: () => context.pushNamed(Routes.workout),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 900),
                      child: Text(
                        "Today's Activity",
                        style: TextStyles.font18BlackW700Inter(context),
                      ),
                    ),
                    SizedBox(height: 16.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActivityUnit(value: "12", label: "Exercises"),
                          ActivityUnit(value: "45", label: "Minutes"),
                          ActivityUnit(value: "6,847", label: "Steps"),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1100),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.calculate_outlined, color: Colors.white),
                            ),
                            SizedBox(width: 16.w(context)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "TDEE Calculator",
                                    style: TextStyles.font16BlackW400Inter(context).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Calculate your daily calorie needs",
                                    style: TextStyles.font12GreyW400Inter(context),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Nutrition'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 1) context.pushNamed(Routes.nutrition);
          if (index == 2) context.pushNamed(Routes.workout);
          // if (index == 3) context.pushNamed(Routes.profile);
        },
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const _StatColumn({required this.title, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.font12GreyW400Inter(context).copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4.h(context)),
        Text(
          value,
          style: TextStyles.font18BlackW700Inter(context).copyWith(color: color ?? Colors.black),
        ),
      ],
    );
  }
}
