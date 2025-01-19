import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_push_button.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_user_form.dart';
import 'package:sprints_profile_management_project/services/user_service.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
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
  final UserService userService = UserService();
  bool isLoading = false;
  Future<void> createUser() async {
    isLoading = true;
    final result = await userService.createUser(User(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      email: emailController.text,
      phoneNumber: phoneController.text,
      gender: genderController.text,
      address: addressController.text,
      name: nameController.text,
      age: ageController.text,
    ));
    result.fold((user) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Success Add User",
          style: AppFontStyle.bold16.copyWith(color: AppColors.white),
        ),
        backgroundColor: Colors.green,
      ));
      context.pop(user);
    }, (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error,
          style: AppFontStyle.bold16.copyWith(color: AppColors.white),
        ),
        backgroundColor: Colors.redAccent,
      ));
    });
    isLoading = false;
    setState(() {});
  }

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
                changeGender: (value) {
                  genderController.text = value;
                  setState(() {});
                },
                nameController: nameController,
                phoneController: phoneController,
                emailController: emailController,
                addressController: addressController,
                ageController: ageController,
                genderController: genderController,
              ),
            ),
            Center(
                child: CustomPushButton(
                    title: 'Create',
                    isLoading: isLoading,
                    onTap: () async {
                      await createUser();
                    })),
            SizedBox(),
          ],
        ),
      ),
    ));
  }
}
