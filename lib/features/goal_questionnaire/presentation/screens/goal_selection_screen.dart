import 'package:flutter/material.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/theme/styles.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String? _selectedGoal;

  final List<Map<String, String>> _goals = [
    {
      'title': 'Lose Weight',
      'subtitle': 'Create a calorie deficit',
    },
    {
      'title': 'Maintain Weight',
      'subtitle': 'Stay at your current weight',
    },
    {
      'title': 'Gain Weight',
      'subtitle': 'Build muscle and mass',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h(context)),
              Text(
                "What's Your Goal?",
                style: TextStyles.font24BlackW700Inter(context),
              ),
              SizedBox(height: 8.h(context)),
              Text(
                "Choose what you want to achieve",
                style: TextStyles.font14GreyW400Inter(context),
              ),
              SizedBox(height: 48.h(context)),
              Expanded(
                child: ListView.separated(
                  itemCount: _goals.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h(context)),
                  itemBuilder: (context, index) {
                    final goal = _goals[index];
                    final isSelected = _selectedGoal == goal['title'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedGoal = goal['title'];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: isSelected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade200,
                            width: 2,
                          ),
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
                            Text(
                              goal['title']!,
                              style: TextStyles.font18BlackW700Inter(context).copyWith(
                                color: isSelected ? Theme.of(context).colorScheme.primary : Colors.black,
                              ),
                            ),
                            SizedBox(height: 4.h(context)),
                            Text(
                              goal['subtitle']!,
                              style: TextStyles.font14GreyW400Inter(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h(context)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedGoal == null
                      ? null
                      : () {
                          context.pushNamed(Routes.userDetails);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyles.font16WhiteW700Inter(context),
                      ),
                      SizedBox(width: 8.w(context)),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
