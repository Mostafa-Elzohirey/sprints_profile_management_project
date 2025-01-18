import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';

class DeleteAlert extends StatefulWidget {
  const DeleteAlert({super.key});

  @override
  State<DeleteAlert> createState() => _DeleteAlertState();
}

class _DeleteAlertState extends State<DeleteAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Icon(Icons.warning, size: 72, color: AppColors.orangeLight),
        title: Text(
          "Are you sure to delete this user?",
          style: AppFontStyle.regular18,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Discard", style: AppFontStyle.regular18)),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              context.pop(true);
            },
            style: TextButton.styleFrom(
                backgroundColor: AppColors.crimson,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)))),
            child: Text("Confirm",
                style: AppFontStyle.regular18.copyWith(color: AppColors.white)),
          )
        ]);
  }
}
