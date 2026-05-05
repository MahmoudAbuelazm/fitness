import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../nutrition/presentation/screens/nutrition_screen.dart';
import '../../../workout/presentation/screens/workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static final List<Widget> _pages = [
    HomeScreen(),
    NutritionScreen(),
    WorkoutScreen(),
    _ProgressPlaceholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.scaffold,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: _AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

// ─────────────────────────── Bottom Nav ───────────────────────────

class _AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _AppBottomNav({required this.currentIndex, required this.onTap});

  static const _tabs = [
    _NavItem(label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
    _NavItem(
      label: 'Nutrition',
      icon: Icons.restaurant_menu_outlined,
      activeIcon: Icons.restaurant_menu,
    ),
    _NavItem(
      label: 'Workout',
      icon: Icons.fitness_center_outlined,
      activeIcon: Icons.fitness_center,
    ),
    _NavItem(
      label: 'Progress',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      decoration: BoxDecoration(
        color: ColorsManagers.cardBg,
        border: const Border(
          top: BorderSide(color: ColorsManagers.border, width: 0.8),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          _tabs.length,
          (i) => Expanded(
            child: _NavButton(
              item: _tabs[i],
              isActive: currentIndex == i,
              onTap: () => onTap(i),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}

class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Icon(
                isActive ? item.activeIcon : item.icon,
                size: 24,
                color: isActive
                    ? ColorsManagers.primary
                    : ColorsManagers.textMuted,
              ),
              if (isActive)
                Positioned(
                  bottom: -4,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: ColorsManagers.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive
                  ? ColorsManagers.primary
                  : ColorsManagers.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────── Progress Placeholder ───────────────────────────

class _ProgressPlaceholder extends StatelessWidget {
  const _ProgressPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagers.scaffold,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bar_chart_outlined,
              size: 64,
              color: ColorsManagers.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Progress',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManagers.textDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: ColorsManagers.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
