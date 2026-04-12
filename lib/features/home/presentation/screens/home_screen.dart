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
                padding: const EdgeInsets.all(24.0),
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
                                'Today',
                                style: TextStyles.font16GreyW500Inter(context),
                              ),
                              Text(
                                'Wed, 12 Apr',
                                style: TextStyles.font24PrimaryW700Inter(context),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 600),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Daily Goals',
                              style: TextStyles.font18BlackW700Inter(context),
                            ),
                            SizedBox(height: 24.h(context)),
                            CalorieRing(
                              currentCalories: state.currentCalories,
                              totalCalories: state.totalCalories,
                              size: 160,
                            ),
                            SizedBox(height: 32.h(context)),
                            Row(
                              children: [
                                Expanded(
                                  child: MacroProgressBar(
                                    title: 'Protein',
                                    currentGrams: state.currentProtein,
                                    totalGrams: 150,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                SizedBox(width: 16.w(context)),
                                Expanded(
                                  child: MacroProgressBar(
                                    title: 'Carbs',
                                    currentGrams: state.currentCarbs,
                                    totalGrams: 200,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(width: 16.w(context)),
                                Expanded(
                                  child: MacroProgressBar(
                                    title: 'Fat',
                                    currentGrams: state.currentFat,
                                    totalGrams: 65,
                                    color: Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 700),
                      child: Row(
                        children: [
                          Expanded(
                            child: _QuickActionCard(
                              icon: Icons.restaurant,
                              title: 'Add Meal',
                              color: Theme.of(context).colorScheme.primary,
                              onTap: () {
                                context.pushNamed(Routes.nutrition);
                              },
                            ),
                          ),
                          SizedBox(width: 16.w(context)),
                          Expanded(
                            child: _QuickActionCard(
                              icon: Icons.fitness_center,
                              title: 'Log Workout',
                              color: Theme.of(context).colorScheme.secondary,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'Activity',
                        style: TextStyles.font20BlackW700Inter(context),
                      ),
                    ),
                    SizedBox(height: 16.h(context)),
                    FadeInUp(
                      duration: const Duration(milliseconds: 900),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _ActivityStatUnit(
                            icon: Icons.directions_run,
                            value: '6.4',
                            unit: 'km',
                            label: 'Distance',
                          ),
                          _ActivityStatUnit(
                            icon: Icons.local_fire_department,
                            value: '450',
                            unit: 'kcal',
                            label: 'Burned',
                          ),
                          _ActivityStatUnit(
                            icon: Icons.access_time,
                            value: '45',
                            unit: 'min',
                            label: 'Active',
                          ),
                        ],
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
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            SizedBox(height: 12.h(context)),
            Text(
              title,
              style: TextStyles.font16BlackW400Inter(context).copyWith(color: color, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityStatUnit extends StatelessWidget {
  final IconData icon;
  final String value;
  final String unit;
  final String label;

  const _ActivityStatUnit({
    required this.icon,
    required this.value,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        SizedBox(height: 8.h(context)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: TextStyles.font18BlackW700Inter(context),
            ),
            SizedBox(width: 2.w(context)),
            Text(
              unit,
              style: TextStyles.font12GreyW400Inter(context),
            ),
          ],
        ),
        SizedBox(height: 4.h(context)),
        Text(
          label,
          style: TextStyles.font12GreyW400Inter(context),
        ),
      ],
    );
  }
}
