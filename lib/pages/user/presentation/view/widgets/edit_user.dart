import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_push_button.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/widgets/custom_user_form.dart';
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
    super.initState();
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
                textTitle: widget.userModel.name.toString(), provider: widget.provider),
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
            CustomPushButton(title: 'Edit', onTap: () {}),
            SizedBox(),
          ],
        ),
      ),
    ));
  }
}
