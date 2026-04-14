import 'package:flutter/material.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/theme/styles.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Nutrition', style: TextStyles.font20BlackW700Inter(context)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track your daily meals',
              style: TextStyles.font14GreyW400Inter(context),
            ),
            SizedBox(height: 24.h(context)),
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.apple_outlined, color: Theme.of(context).colorScheme.primary),
                          SizedBox(width: 8.w(context)),
                          Text(
                            'Total Calories',
                            style: TextStyles.font16BlackW400Inter(context).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '1,680',
                            style: TextStyles.font20BlackW700Inter(context),
                          ),
                          Text(
                            'of 2,200 kcal',
                            style: TextStyles.font12GreyW400Inter(context),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16.h(context)),
                  LinearProgressIndicator(
                    value: 1680 / 2200,
                    backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                    color: Theme.of(context).colorScheme.primary,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h(context)),
            const _MealSection(
              title: 'Breakfast',
              icon: Icons.coffee_outlined,
              totalKcal: 500,
              items: [
                {'name': 'Oatmeal with Banana', 'time': '8:30 AM', 'kcal': 320},
                {'name': 'Protein Shake', 'time': '8:45 AM', 'kcal': 180},
              ],
            ),
            SizedBox(height: 24.h(context)),
            const _MealSection(
              title: 'Lunch',
              icon: Icons.wb_sunny_outlined,
              totalKcal: 570,
              items: [],
            ),
            SizedBox(height: 24.h(context)),
            const _MealSection(
              title: 'Dinner',
              icon: Icons.nights_stay_outlined,
              totalKcal: 610,
              items: [],
            ),
          ],
        ),
      ),
    );
  }
}

class _MealSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final int totalKcal;
  final List<Map<String, dynamic>> items;

  const _MealSection({
    required this.title,
    required this.icon,
    required this.totalKcal,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: Colors.orange, size: 20),
                    ),
                    SizedBox(width: 12.w(context)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyles.font16BlackW400Inter(context).copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '$totalKcal kcal',
                          style: TextStyles.font12GreyW400Inter(context).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey.shade200),
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: Colors.grey, size: 20),
                )
              ],
            ),
          ),
          if (items.isNotEmpty)
            const Divider(height: 1, thickness: 1, color: Color(0xFFF3F3F3)),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: TextStyles.font14GreyW600Inter(context).copyWith(color: Colors.black87),
                        ),
                        SizedBox(height: 4.h(context)),
                        Text(
                          item['time'],
                          style: TextStyles.font12GreyW400Inter(context),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
