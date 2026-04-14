import 'package:flutter/material.dart';

class CalorieRing extends StatelessWidget {
  final int currentCalories;
  final int totalCalories;
  final double size;

  const CalorieRing({
    super.key,
    required this.currentCalories,
    required this.totalCalories,
    this.size = 200.0,
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
            strokeWidth: 16,
            color: Colors.grey.shade200,
          ),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 16,
            backgroundColor: Colors.transparent,
            color: Theme.of(context).colorScheme.primary,
            strokeCap: StrokeCap.round,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_fire_department_outlined, color: Theme.of(context).colorScheme.primary, size: 28),
              const SizedBox(height: 4),
              Text(
                '$remaining',
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              const Text(
                'Remaining',
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
