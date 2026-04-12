import 'package:flutter/material.dart';

class CalorieRing extends StatelessWidget {
  final int currentCalories;
  final int totalCalories;
  final double size;

  const CalorieRing({
    super.key,
    required this.currentCalories,
    required this.totalCalories,
    this.size = 180.0,
  });

  @override
  Widget build(BuildContext context) {
    double progress = totalCalories > 0 ? currentCalories / totalCalories : 0;
    int remaining = totalCalories - currentCalories;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 12,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          ),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 12,
            backgroundColor: Colors.transparent,
            color: Theme.of(context).colorScheme.primary,
            strokeCap: StrokeCap.round,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$remaining',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Kcal Left',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
