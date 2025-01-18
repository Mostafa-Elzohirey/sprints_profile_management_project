import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_details/create_new.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/user_card.dart';
import 'package:sprints_profile_management_project/theme/theme.dart';
import 'package:sprints_profile_management_project/theme/theme_provider.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: MediaQuery.of(context).size.height*0.1,
        title: Text(
          "Users",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.04,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(CreateUser());
            },
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.grey
            ),
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.white
            )
          ),
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.9,
          child: ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.025),
                    child: UserCard(index: index)
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01)
                ],
              );
            }
          )
        )
      ),
    );
  }
}