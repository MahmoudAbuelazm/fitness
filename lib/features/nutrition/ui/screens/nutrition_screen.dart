import 'package:flutter/material.dart';
import 'package:fitness/core/helpers/extensions.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Add Meal'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Eaten',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      4.verticalSpace,
                      const Text(
                        '1,250 kcal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.local_dining,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
            32.verticalSpace,
            const _MealSection(
              title: 'Breakfast',
              totalKcal: 450,
              items: [
                {'name': 'Oatmeal with berries', 'kcal': 320},
                {'name': 'Black Coffee', 'kcal': 5},
                {'name': 'Boiled Egg', 'kcal': 125},
              ],
            ),
            24.verticalSpace,
            const _MealSection(
              title: 'Lunch',
              totalKcal: 800,
              items: [
                {'name': 'Grilled Chicken Salad', 'kcal': 450},
                {'name': 'Olive Oil Dressing', 'kcal': 150},
                {'name': 'Brown Rice', 'kcal': 200},
              ],
            ),
            24.verticalSpace,
            const _MealSection(
              title: 'Dinner',
              totalKcal: 0,
              items: [],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _MealSection extends StatelessWidget {
  final String title;
  final int totalKcal;
  final List<Map<String, dynamic>> items;

  const _MealSection({
    required this.title,
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$totalKcal kcal',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (items.isNotEmpty)
            const Divider(height: 1, thickness: 1),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${item['kcal']} kcal',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'No meals logged yet',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
