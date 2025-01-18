import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';

class CustomPushButton extends StatelessWidget {
  const CustomPushButton(
      {super.key, required this.title, this.besideTitle, required this.onTap});
  final String title;
  final Widget? besideTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
            color: AppColors.greyDark,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppFontStyle.bold16.copyWith(color: AppColors.white),
            ),
            besideTitle ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
