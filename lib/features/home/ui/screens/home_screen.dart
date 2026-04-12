import 'package:flutter/material.dart';
import 'package:fitness/features/home/ui/widgets/calorie_ring.dart';
import 'package:fitness/features/home/ui/widgets/macro_progress_bar.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/helpers/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Wed, 12 Apr',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
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
              32.verticalSpace,
              Container(
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
                    const Text(
                      'Daily Goals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    24.verticalSpace,
                    const CalorieRing(
                      currentCalories: 1250,
                      totalCalories: 2500,
                      size: 160,
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: MacroProgressBar(
                            title: 'Protein',
                            currentGrams: 85,
                            totalGrams: 150,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: MacroProgressBar(
                            title: 'Carbs',
                            currentGrams: 120,
                            totalGrams: 200,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: MacroProgressBar(
                            title: 'Fat',
                            currentGrams: 40,
                            totalGrams: 65,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              32.verticalSpace,
              Row(
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
                  16.horizontalSpace,
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
              32.verticalSpace,
              const Text(
                'Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.verticalSpace,
              Row(
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
            ],
          ),
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
            12.verticalSpace,
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
              ),
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
        8.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            2.horizontalSpace,
            Text(
              unit,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
