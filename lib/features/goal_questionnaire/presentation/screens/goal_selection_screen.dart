import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/extinsions.dart';
import '../../../../core/theme/colors.dart';

enum GoalType { loseWeight, maintainWeight, gainWeight }

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  GoalType? _selectedGoal;

  final List<_GoalOption> _goals = [
    _GoalOption(
      type: GoalType.loseWeight,
      title: 'Lose Weight',
      subtitle: 'Create a calorie deficit',
    ),
    _GoalOption(
      type: GoalType.maintainWeight,
      title: 'Maintain Weight',
      subtitle: 'Stay at your current weight',
    ),
    _GoalOption(
      type: GoalType.gainWeight,
      title: 'Gain Weight',
      subtitle: 'Build muscle and mass',
    ),
  ];

  void _onGoalSelected(GoalType type) {
    setState(() => _selectedGoal = type);

    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      context.pushNamed('/user-details', arguments: _selectedGoal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.scaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "What's Your Goal?",
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: ColorsManagers.textDark2,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose what you want to achieve',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorsManagers.textSubtle,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              ..._goals.map(
                (goal) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _GoalCard(
                    option: goal,
                    isSelected: _selectedGoal == goal.type,
                    onTap: () => _onGoalSelected(goal.type),
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

class _GoalOption {
  final GoalType type;
  final String title;
  final String subtitle;

  const _GoalOption({
    required this.type,
    required this.title,
    required this.subtitle,
  });
}

class _GoalCard extends StatelessWidget {
  final _GoalOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _GoalCard({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(25.6, 25.6, 25.6, 25.6),
        decoration: BoxDecoration(
          color: ColorsManagers.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? ColorsManagers.primary
                : const Color(0x14000000),
            width: isSelected ? 1.6 : 1.6,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              option.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorsManagers.textDark2,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              option.subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorsManagers.textSubtle,
                height: 1.43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
