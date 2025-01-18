import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';

OutlineInputBorder customOutLineBorders(
    {double? borderRadius, Color? borderColor, double? borderWidth}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.greyMedium,
        width: borderWidth ?? 1,
      ));
}