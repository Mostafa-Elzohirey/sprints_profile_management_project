import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_details/user_form.dart';
import 'package:sprints_profile_management_project/theme/theme_provider.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';
import '../../theme/theme.dart';

class GoToEdit extends StatefulWidget {
  const GoToEdit({super.key, required this.userID});

  final int userID;

  @override
  State<GoToEdit> createState() => _GoToEditState();
}

class _GoToEditState extends State<GoToEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        leading:  IconButton(
          onPressed: () {
            context.pop();
          },
          style: IconButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.white
          ),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          )
        ),
        title: Text(
          "Name",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.04,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              setState(() {
              });
            }, 
            icon: Icon(
              Provider.of<ThemeProvider>(context, listen: false).themeData == lightMode ? 
                Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.primary
            )
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserForm(),
            ElevatedButton(
              onPressed: () {
                // edit API
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.01)
                ),
                maximumSize: MediaQuery.of(context).size*0.26
              ),
              child: Row(
                children: [
                  Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward)
                ],
              )
            )
          ],
        ),
      )
    );
  }
}