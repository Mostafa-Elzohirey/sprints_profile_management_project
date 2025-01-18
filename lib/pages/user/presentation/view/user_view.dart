import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_push_button.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_user_form.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/edit_user.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            spacing: 12,
            children: [
              CustomUserDetailsAppBar(
                  textTitle: "${user.name}", provider: provider),
              Expanded(
                child: CustomUserForm(
                  isReadOnly: true,
                  userModel: user,
                ),
              ),
              Center(
                child: CustomPushButton(
                  onTap: () {
                    context.pushReplacement(EditCurrentUser(
                      provider: provider,
                      userModel: user,
                    ));
                  },
                  title: 'Go to Edit',
                  besideTitle: Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
