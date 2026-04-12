import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension IntSpacingExtension on int {
  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}

extension DoubleSpacingExtension on double {
  SizedBox get verticalSpace => SizedBox(height: this);
  SizedBox get horizontalSpace => SizedBox(width: this);
}
