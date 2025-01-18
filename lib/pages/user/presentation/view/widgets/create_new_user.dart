import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_push_button.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_user_form.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class CreateNewUser extends StatefulWidget {
  const CreateNewUser({super.key, required this.provider});
  final ThemeProvider provider;

  @override
  State<CreateNewUser> createState() => _CreateNewUserState();
}

class _CreateNewUserState extends State<CreateNewUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          spacing: 12,
          children: [
            CustomUserDetailsAppBar(
                textTitle: 'Create New', provider: widget.provider),
            Expanded(
              child: CustomUserForm(
                nameController: nameController,
                phoneController: phoneController,
                emailController: emailController,
                addressController: addressController,
                ageController: ageController,
                genderController: genderController,
              ),
            ),
            Center(child: CustomPushButton(title: 'Create', onTap: () {})),
            SizedBox(),
          ],
        ),
      ),
    ));
  }
}
