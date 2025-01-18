import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_list/user_list.dart';
import 'package:sprints_profile_management_project/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile Management',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const UserListPage(),
    );
  }
}
