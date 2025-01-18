import 'package:flutter/material.dart';

class UserFrom extends StatefulWidget {
  const UserFrom({super.key});

  @override
  State<UserFrom> createState() => _UserFromState();
}

class _UserFromState extends State<UserFrom> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder()
              )
            ),
            /*Row(
              children: [
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                  
                  },
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder()
                  )
                ),
                TextFormField(
                  controller: ageController,
                  validator: (value) {
                  
                  },
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder()
                  )
                ),
              ],
            )*/
            TextFormField(
              controller: emailController,
              validator: (value) {
                  
              },
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder()
              )
            ),
          ],
        ),
      )
    );
  }
}