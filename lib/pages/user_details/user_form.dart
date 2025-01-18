import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? selectedGender = 'Male';

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value != null && value.trim().isEmpty) {
                      return 'Name Can\'t be empty';
                    }
                    return null;
                  },
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder()
                  )
                ),
                TextFormField(
                  controller: ageController,
                  validator: (value) {
                    if (value != null && value.trim().isEmpty) {
                      return 'Age Can\'t be empty';
                    }
                    return null;
                  },
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  decoration: InputDecoration(
                    labelText: "Age",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder()
                  )
                ),
              
            TextFormField(
              controller: emailController,
              validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return 'Email Can\'t be empty ';
                  }
                  else if (value != null && value.contains('@')) {
                    return 'Enter a valid Email';
                  }
                  return null;
              },
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                border: OutlineInputBorder()
              )
            ),

            DropdownButton<String>(
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              underline: Container(),
              value: selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  
                  ),
                );
              }).toList(),
            ),
            TextFormField(
              controller: addressController,
              validator: (value) {
                  if (value != null && value.trim().isEmpty) {
                    return 'Address Can\'t be empty ';
                  }
                  return null;
              },
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                labelText: "Address",
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