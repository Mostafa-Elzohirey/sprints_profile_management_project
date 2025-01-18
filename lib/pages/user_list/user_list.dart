import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/user_card.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';
import 'package:sprints_profile_management_project/services/user_service.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserService services = UserService();
  bool isLoading = true;
  Future<void> getUsers() async {
    services.users = await services.getUsers();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

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
                    key: ValueKey(1),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: services.users.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(
                        index: index,
                        user: services.users[index],
                        delete: (currIndex) {
                          setState(() {
                            services.users.removeAt(currIndex);
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
