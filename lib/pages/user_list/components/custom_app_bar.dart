import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/create_new_user.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class UserListAppBar extends StatelessWidget {
  const UserListAppBar({
    super.key,
    required this.provider,
    required this.refreshList,
  });

  final ThemeProvider provider;
  final Future<void> Function() refreshList;

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
            onPressed: () async {
              var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateNewUser(provider: provider)));

              if (result != null) {
                refreshList();
              }
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
