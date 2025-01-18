import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/model/user_model.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/user_card.dart';
import 'package:sprints_profile_management_project/services/user_service.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<UserModel>> _users;

  Future<List<UserModel>> _fetchUsers() async {
    final userService = UserService();
    return await userService.getUsers();
  }

  @override
  void initState() {
    super.initState();
    _users = _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            body: FutureBuilder<List<UserModel>>(
      future: _users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          List<UserModel> items = snapshot.data!;
          return Column(
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
          );
        }
      },
    )));
  }
}
