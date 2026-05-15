import 'package:flutter/material.dart';

import '../../../../core/helpers/extinsions.dart';
import '../../../../core/theme/styles.dart';

class ActivityUnit extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const ActivityUnit({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyles.font24BlackW700Inter(
            context,
          ).copyWith(color: color),
        ),
        SizedBox(height: 4.h(context)),
        Text(label, style: TextStyles.font12GreyW400Inter(context)),
      ],
    );
  }
}
