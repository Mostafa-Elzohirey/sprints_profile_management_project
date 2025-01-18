import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/user_card.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<int> items = List<int>.generate(10, (int index) => index);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            UserListAppBar(provider: provider),
            Expanded(
                child: ListView.separated(
                  key: ValueKey(items.length),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: items.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(
                        index: index,
                        delete: (currIndex) {
                          setState(() {
                            items.removeAt(currIndex);
                          });
                        },
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
