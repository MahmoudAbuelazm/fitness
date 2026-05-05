import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';


class WorkoutSet {
  final int reps;
  final double weightKg;

  const WorkoutSet({required this.reps, required this.weightKg});
}

class WorkoutExercise {
  final String name;
  final String muscleGroup;
  final int sets;
  final List<WorkoutSet> completedSets;
  final Color tagColor;

  const WorkoutExercise({
    required this.name,
    required this.muscleGroup,
    required this.sets,
    required this.completedSets,
    required this.tagColor,
  });

  bool get isCompleted => completedSets.length >= sets;
}


class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  static final List<WorkoutExercise> _exercises = [
    WorkoutExercise(
      name: 'Bench Press',
      muscleGroup: 'Chest',
      sets: 4,
      completedSets: [
        WorkoutSet(reps: 10, weightKg: 60),
        WorkoutSet(reps: 8, weightKg: 65),
        WorkoutSet(reps: 8, weightKg: 65),
        WorkoutSet(reps: 6, weightKg: 70),
      ],
      tagColor: ColorsManagers.carbs,
    ),
    WorkoutExercise(
      name: 'Pull-Ups',
      muscleGroup: 'Back',
      sets: 3,
      completedSets: [
        WorkoutSet(reps: 10, weightKg: 0),
        WorkoutSet(reps: 8, weightKg: 0),
      ],
      tagColor: ColorsManagers.primary,
    ),
    WorkoutExercise(
      name: 'Squats',
      muscleGroup: 'Legs',
      sets: 4,
      completedSets: [],
      tagColor: ColorsManagers.fat,
    ),
    WorkoutExercise(
      name: 'Shoulder Press',
      muscleGroup: 'Shoulders',
      sets: 3,
      completedSets: [],
      tagColor: ColorsManagers.exercises,
    ),
    WorkoutExercise(
      name: 'Tricep Dips',
      muscleGroup: 'Arms',
      sets: 3,
      completedSets: [],
      tagColor: const Color(0xFFAD46FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.scaffold,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23, 16, 23, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Workout',
                              style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: ColorsManagers.textDark,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Today's training session",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorsManagers.textMuted,
                              ),
                            ),
                          ],
                        ),
                        // Start / Resume button
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: ColorsManagers.primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            'Start',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _WorkoutSummaryRow(exercises: _exercises),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ExerciseCard(exercise: _exercises[index]),
                  ),
                  childCount: _exercises.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        backgroundColor: ColorsManagers.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(
          'Add Exercise',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// ─────────────────────────── Summary Row ───────────────────────────

class _WorkoutSummaryRow extends StatelessWidget {
  final List<WorkoutExercise> exercises;

  const _WorkoutSummaryRow({required this.exercises});

  @override
  Widget build(BuildContext context) {
    final totalSets = exercises.fold<int>(0, (sum, e) => sum + e.sets);
    final completedSets = exercises.fold<int>(
      0,
      (sum, e) => sum + e.completedSets.length,
    );
    final completedEx = exercises.where((e) => e.isCompleted).length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsManagers.primary.withOpacity(0.15),
            ColorsManagers.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsManagers.primaryBorder, width: 0.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(
            value: '$completedEx/${exercises.length}',
            label: 'Exercises',
            valueColor: ColorsManagers.primary,
          ),
          _VerticalDivider(),
          _SummaryItem(
            value: '$completedSets/$totalSets',
            label: 'Sets Done',
            valueColor: ColorsManagers.carbs,
          ),
          _VerticalDivider(),
          _SummaryItem(
            value: '45',
            label: 'Minutes',
            valueColor: ColorsManagers.fat,
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 0.8, height: 40, color: ColorsManagers.border);
  }
}

class _SummaryItem extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  const _SummaryItem({
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorsManagers.textMuted,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────── Exercise Card ───────────────────────────

class _ExerciseCard extends StatelessWidget {
  final WorkoutExercise exercise;

  const _ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    final progress = exercise.sets > 0
        ? exercise.completedSets.length / exercise.sets
        : 0.0;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorsManagers.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManagers.border, width: 0.8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Muscle group tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: exercise.tagColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  exercise.muscleGroup,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: exercise.tagColor,
                  ),
                ),
              ),
              const Spacer(),
              if (exercise.isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorsManagers.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 14,
                        color: ColorsManagers.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Done',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: ColorsManagers.primary,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                exercise.name,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: ColorsManagers.textDark,
                ),
              ),
              Text(
                '${exercise.completedSets.length}/${exercise.sets} sets',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color:  ColorsManagers.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFF3F4F6),
              valueColor: AlwaysStoppedAnimation<Color>(exercise.tagColor),
            ),
          ),
        ],
      ),
    );
  }
}
