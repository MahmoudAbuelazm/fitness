import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';


// ─────────────────────────── Models ───────────────────────────

class MealEntry {
  final String name;
  final String time;
  final int calories;

  const MealEntry({
    required this.name,
    required this.time,
    required this.calories,
  });
}

class MealSection {
  final String title;
  final int totalKcal;
  final Color iconBg;
  final Color calColor;
  final IconData icon;
  final List<MealEntry> entries;

  const MealSection({
    required this.title,
    required this.totalKcal,
    required this.iconBg,
    required this.calColor,
    required this.icon,
    required this.entries,
  });
}

// ─────────────────────────── Screen ───────────────────────────

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  static const int _goalKcal = 2200;
  static const int _consumedKcal = 1680;

  static final List<MealSection> _meals = [
    MealSection(
      title: 'Breakfast',
      totalKcal: 500,
      iconBg: Color(0x21F59E0B),
      calColor: Color(0xFFF59E0B),
      icon: Icons.breakfast_dining_outlined,
      entries: [
        MealEntry(name: 'Oatmeal with Banana', time: '8:30 AM', calories: 320),
        MealEntry(name: 'Protein Shake', time: '8:45 AM', calories: 180),
      ],
    ),
    MealSection(
      title: 'Lunch',
      totalKcal: 570,
      iconBg: Color(0x21A8BBA3),
      calColor: ColorsManagers.primary,
      icon: Icons.lunch_dining_outlined,
      entries: [
        MealEntry(name: 'Grilled Chicken Salad', time: '1:00 PM', calories: 420),
        MealEntry(name: 'Greek Yogurt', time: '1:30 PM', calories: 150),
      ],
    ),
    MealSection(
      title: 'Dinner',
      totalKcal: 610,
      iconBg: Color(0x213B82F6),
      calColor: ColorsManagers.carbs,
      icon: Icons.dinner_dining_outlined,
      entries: [
        MealEntry(name: 'Salmon with Rice', time: '7:00 PM', calories: 480),
        MealEntry(name: 'Steamed Vegetables', time: '7:15 PM', calories: 130),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.scaffold,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nutrition',
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: ColorsManagers.textDark,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Track your daily meals',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorsManagers.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Total Calories Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: _TotalCaloriesCard(
                      consumed: _consumedKcal,
                      goal: _goalKcal,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Meal Sections
                  ..._meals.map(
                    (meal) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: _MealCard(meal: meal),
                    ),
                  ),
                ],
              ),
            ),

            // FAB
            Positioned(
              top: 8,
              right: 16,
              child: _AddMealFab(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────── Total Calories Card ───────────────────────────

class _TotalCaloriesCard extends StatelessWidget {
  final int consumed;
  final int goal;

  const _TotalCaloriesCard({required this.consumed, required this.goal});

  @override
  Widget build(BuildContext context) {
    final progress = (consumed / goal).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.85, -0.52),
          end: const Alignment(0.85, 0.52),
          colors: [
            ColorsManagers.primary.withOpacity(0.2),
            ColorsManagers.primary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorsManagers.addMealBorder, width: 0.8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_outlined,
                    color: ColorsManagers.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Total Calories',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorsManagers.textBody,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _fmt(consumed),
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsManagers.textDark,
                    ),
                  ),
                  Text(
                    'of ${_fmt(goal)} kcal',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorsManagers.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: ColorsManagers.border,
              valueColor: AlwaysStoppedAnimation<Color>(ColorsManagers.primary),
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(int v) {
    if (v >= 1000) {
      return '${(v / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')},${(v % 1000).toString().padLeft(3, '0')}';
    }
    return '$v';
  }
}

// ─────────────────────────── Meal Card ───────────────────────────

class _MealCard extends StatelessWidget {
  final MealSection meal;

  const _MealCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: ColorsManagers.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManagers.border, width: 0.8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Meal header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: meal.iconBg,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(meal.icon, size: 20, color: ColorsManagers.textDark),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.title,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorsManagers.textDark,
                        ),
                      ),
                      Text(
                        '${meal.totalKcal} kcal',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorsManagers.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // TODO: add food item
                },
                child: const Icon(Icons.add, size: 20, color: ColorsManagers.textMuted),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: ColorsManagers.border, thickness: 0.8),
          const SizedBox(height: 4),

          // Entries
          ...meal.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _MealEntryRow(entry: entry, calColor: meal.calColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _MealEntryRow extends StatelessWidget {
  final MealEntry entry;
  final Color calColor;

  const _MealEntryRow({required this.entry, required this.calColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF1E2939),
              ),
            ),
            Text(
              entry.time,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorsManagers.textLight,
              ),
            ),
          ],
        ),
        Text(
          '${entry.calories} cal',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: calColor,
          ),
        ),
      ],
    );
  }
}


class _AddMealFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: show add meal bottom sheet
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorsManagers.primary, ColorsManagers.primary.withOpacity(0.7)],
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManagers.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: ColorsManagers.primary.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
