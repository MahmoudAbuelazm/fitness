import 'package:flutter/material.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/theme/styles.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Workout', style: TextStyles.font20BlackW700Inter(context)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's training session",
              style: TextStyles.font14GreyW400Inter(context),
            ),
            SizedBox(height: 32.h(context)),
            // Placeholder for exercise list
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fitness_center_outlined,
                      size: 64,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 16.h(context)),
                    Text(
                      'No workouts scheduled for today',
                      style: TextStyles.font16GreyW500Inter(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
