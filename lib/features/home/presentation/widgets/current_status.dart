
import 'package:animate_do/animate_do.dart';
import 'package:fitness/features/home/presentation/widgets/calorie_ring.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extinsions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class CurrentStatus extends StatelessWidget {
  const CurrentStatus({
    super.key,
    required this.currentCalories,
    required this.totalCalories,
  });

  final int currentCalories;
  final int totalCalories;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
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
          children: [
            CalorieRing(
              currentCalories: currentCalories,
              totalCalories: totalCalories,
              size: 175,
            ),
            SizedBox(height: 32.h(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatColumn(title: 'Goal', value: '$totalCalories'),
                _StatColumn(
                  title: 'Consumed',
                  value: '$currentCalories',
                  color: Theme.of(context).colorScheme.primary,
                ),
                _StatColumn(title: 'Burned', value: '420'),
              ],
            ),
          ],
        ),
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
        Text(title, style: TextStyles.font12GreyW400Inter(context)),
        SizedBox(height: 4.h(context)),
        Text(
          value,
          style: TextStyles.font18BlackW700Inter(
            context,
          ).copyWith(color: color ?? ColorsManagers.mirage),
        ),
      ],
    );
  }
}
