import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_weight_helper.dart';
import '../utils/size_config.dart';

class TextStyles {
  // Splash Screen
  static TextStyle font32PrimaryW800Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeightHelper.extraBold,
      color: Theme.of(context).colorScheme.primary,
      letterSpacing: 2,
    );
  }

  // Onboarding
  static TextStyle font36WhiteW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontWeight: FontWeightHelper.bold,
      color: Colors.white,
    );
  }

  static TextStyle font36NeutralGreenW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontWeight: FontWeightHelper.bold,
      color: ColorsManagers.neutralGreen,
    );
  }

  static TextStyle font18WhiteOpacity80W400Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeightHelper.regular,
      color: Colors.white.withValues(alpha: 0.8),
    );
  }

  static TextStyle font16WhiteW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeightHelper.bold,
      color: Colors.white,
    );
  }

  // General App Text
  static TextStyle font16GreyW500Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeightHelper.medium,
      color: Colors.grey,
    );
  }

  static TextStyle font24PrimaryW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeightHelper.bold,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle font18BlackW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeightHelper.bold,
      color: ColorsManagers.eerieBlack,
    );
  }

  static TextStyle font20BlackW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeightHelper.bold,
      color: ColorsManagers.eerieBlack,
    );
  }

  static TextStyle font12GreyW400Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeightHelper.regular,
      color: Colors.grey,
    );
  }

  static TextStyle font14GreyW600Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.grey,
    );
  }

  static TextStyle font14WhiteOpacity70W400Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.regular,
      color: Colors.white70,
    );
  }

  static TextStyle font24WhiteW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeightHelper.bold,
      color: Colors.white,
    );
  }

  static TextStyle font24BlackW700Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeightHelper.bold,
      color: ColorsManagers.eerieBlack,
    );
  }

  static TextStyle font16BlackW400Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeightHelper.regular,
      color: ColorsManagers.eerieBlack,
    );
  }

  static TextStyle font14GreyW400Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.regular,
      color: Colors.grey,
    );
  }

  static TextStyle font16PrimaryW600Inter(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeightHelper.semiBold,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  }
  return width / 1500;
}
