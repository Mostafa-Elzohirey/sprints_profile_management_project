import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/create_new_user.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class UserListAppBar extends StatelessWidget {
  const UserListAppBar({
    super.key,
    required this.provider,
  });

  final ThemeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Users",
          style: AppFontStyle.bold36,
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              context.push(CreateNewUser(
                provider: provider,
              ));
            },
            style: IconButton.styleFrom(
                shape: CircleBorder(), backgroundColor: Colors.grey),
            icon: Icon(Icons.edit_outlined, color: Colors.white)),
        IconButton(
            onPressed: () {
              provider.toggleTheme();
            },
            icon: Icon(
              provider.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            )),
      ],
    );
  }
}
