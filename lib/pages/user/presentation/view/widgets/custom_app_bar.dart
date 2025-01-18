import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class CustomUserDetailsAppBar extends StatelessWidget {
  const CustomUserDetailsAppBar(
      {super.key, required this.textTitle, required this.provider});
  final String textTitle;
  final ThemeProvider provider;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back)),
        Text(
          textTitle,
          style: AppFontStyle.bold36,
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              provider.toggleTheme();
            },
            icon: Icon(provider.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode))
      ],
    );
  }
}
