import 'package:flutter/material.dart';

class MacroProgressBar extends StatelessWidget {
  final String title;
  final int currentGrams;
  final int totalGrams;
  final Color color;

  const MacroProgressBar({
    super.key,
    required this.title,
    required this.currentGrams,
    required this.totalGrams,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double progress = totalGrams > 0 ? currentGrams / totalGrams : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Text(
              '$currentGrams / ${totalGrams}g',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withValues(alpha: 0.2),
          color: color,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
