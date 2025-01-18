import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_list/user_list.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeMode: themeProvider.themeMode,
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.white,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: WidgetStatePropertyAll<Color>(Colors.black)))),
      home: const UserListPage(),
    );
  }
}
