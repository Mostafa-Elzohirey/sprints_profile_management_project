import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/custom_app_bar.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/user_card.dart';
import 'package:sprints_profile_management_project/utils/constants.dart';
import 'package:sprints_profile_management_project/utils/theme/app_font_style.dart';
import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';
import 'package:sprints_profile_management_project/services/user_service.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserService services = UserService();
  ApiStage apiStages = ApiStage.loading;
  String? errMessage;
  List<User> usersList = [];
  Future<void> getUsers() async {
    apiStages = ApiStage.loading;
    final result = await services.getUsers();
    result.fold((list) {
      apiStages = ApiStage.success;
      usersList.addAll(list);
    }, (error) {
      apiStages = ApiStage.error;
      errMessage = error;
    });
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
          switch (apiStages) {
            ApiStage.loading => CircularProgressIndicator(),
            ApiStage.success => Expanded(
                child: ListView.separated(
                    key: ValueKey(usersList.length),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: usersList.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(
                        user: usersList[index],
                        index: index,
                        delete: (currIndex) async {
                          final result = await services.deleteUser(
                              usersList[index].id, index);
                          result.fold((check) {
                           check ?usersList.removeAt(currIndex):null;
                          }, (error) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(error)));
                          });

                          setState(() {});
                        },
                      );
                    })),
            ApiStage.error => Text(
                "$errMessage",
                style: AppFontStyle.bold18,
              ),
          }
        ],
      ),
    ));
  }
}
