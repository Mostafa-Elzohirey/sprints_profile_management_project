import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/model/user_model.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/widgets/custom_text_form_feild.dart';

class CustomUserForm extends StatelessWidget {
  const CustomUserForm(
      {super.key,
      this.isReadOnly = false,
      this.emailController,
      this.nameController,
      this.ageController,
      this.phoneController,
      this.genderController,
      this.addressController,
      this.userModel});
  final bool isReadOnly;
  final TextEditingController? emailController;
  final TextEditingController? nameController;
  final TextEditingController? ageController;
  final TextEditingController? phoneController;
  final TextEditingController? genderController;
  final TextEditingController? addressController;
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          label: 'Name',
          enableFill: false,
          initalText: userModel?.name,
          controller: emailController,
          isReadOnly: isReadOnly,
        ),
        Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextFormField(
                label: 'Phone Number',
                enableFill: false,
                controller: phoneController,
                initalText: userModel?.phoneNumber,
                isReadOnly: isReadOnly,
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                  label: 'Age',
                  enableFill: false,
                  controller: ageController,
                  isReadOnly: isReadOnly,
                  initalText: userModel?.age.toString()),
            ),
          ],
        ),
        CustomTextFormField(
          label: 'Email',
          enableFill: false,
          initalText: userModel?.email,
          controller: emailController,
        ),
        Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: CustomTextFormField(
                  label: 'Age',
                  suffixWidget:isReadOnly?null: PopupMenuButton(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            onTap: () {},
                            child: Text(
                              "Male",
                              style: AppFontStyle.bold16,
                            )),
                        PopupMenuItem(
                            onTap: () {},
                            child: Text(
                              "Female",
                              style: AppFontStyle.bold16,
                            )),
                      ];
                    },
                  ),
                  enableFill: false,
                  controller: ageController,
                  isReadOnly: isReadOnly,
                  initalText: userModel?.gender),
            ),
            Expanded(
              child: CustomTextFormField(
                label: 'address',
                  enabled: true,
                  enableFill: false,
                  controller: addressController,
                  isReadOnly: isReadOnly,
                  initalText: userModel?.address),
            ),
          ],
        ),
      ],
    );
  }
}
