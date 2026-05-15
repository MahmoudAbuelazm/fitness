import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extinsions.dart';
import '../../../../core/theme/styles.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha: 0.3)),
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.2),
              color.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
            Container(
              height: 24.8.h(context),
              width: 24.8.h(context),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 16.h(context)),
            Text(
              title,
              style: TextStyles.font14GreyW600Inter(
                context,
              ).copyWith(color: Colors.black87),
            ),
            SizedBox(height: 6.h(context)),
            Text(subtitle, style: TextStyles.font12GreyW400Inter(context)),
          ],
        ),
      ),
    );
  }
}
