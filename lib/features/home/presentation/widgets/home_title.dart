
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/styles.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fitness',
                style: TextStyles.font30MirageW700Inter(context),
              ),
    
              Text(
                'Sunday, April 10',
                style: TextStyles.font14GreyW400Inter(context),
              ),
            ],
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              'FN',
              style: TextStyles.font16WhiteW700Inter(context),
            ),
          ),
        ],
      ),
    );
  }
}