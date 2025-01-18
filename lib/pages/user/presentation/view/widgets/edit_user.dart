import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_push_button.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_user_form.dart';
import 'package:sprints_profile_management_project/services/user_service.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class EditCurrentUser extends StatefulWidget {
  const EditCurrentUser(
      {super.key, required this.provider, required this.userModel});
  final ThemeProvider provider;
  final User userModel;
  @override
  State<EditCurrentUser> createState() => _EditCurrentUserState();
}

class _EditCurrentUserState extends State<EditCurrentUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  void initState() {
    nameController.text = widget.userModel.name.toString();
    ageController.text = widget.userModel.age.toString();
    phoneController.text = widget.userModel.phoneNumber ?? "un specified";
    addressController.text = widget.userModel.address ?? "un specified";
    emailController.text = widget.userModel.email ?? "un specified";
    genderController.text = widget.userModel.gender!;
    emailController.text = widget.userModel.email.toString();
    genderController.text = widget.userModel.gender.toString();
    setState(() {
      
    });
    super.initState();
  }

  bool isLoading = false;
  final UserService userService = UserService();
  Future<void> editUser() async {
    isLoading = true;
    final result = await userService.createUser(User(
      id: widget.userModel.id,
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
                textTitle: widget.userModel.name!, provider: widget.provider),
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
            CustomPushButton(
                isLoading: isLoading,
                title: 'Edit',
                onTap: () async {
                  await editUser();
                }),
            SizedBox(),
          ],
        ),
      ),
    ));
  }
}
