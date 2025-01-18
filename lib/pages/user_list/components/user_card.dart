import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user/data/models/user_model.dart';
import 'package:sprints_profile_management_project/pages/user/presentation/view/user_view.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/alert_dialog.dart';
import 'package:sprints_profile_management_project/utils/theme/app_colors.dart';
import 'package:sprints_profile_management_project/utils/navigation.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.index,
      required this.delete,
      required this.user});

  final int index;
  final void Function(int index) delete;
  final User user;
  @override
  Widget build(BuildContext context) {
    Color backGroundColor = cardColorList[(index % cardColorList.length)];
    return Dismissible(
        background: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            color: AppColors.crimson,
          ),
          child: Align(
              alignment: Alignment.centerLeft, child: const Icon(Icons.delete)),
        ),
        confirmDismiss: (direction) async {
          final bool? confirm = await showDialog<bool>(
            context: context,
            builder: (context) => const DeleteAlert(),
          );

          if (confirm == true) {
            delete(index);
            return true;
          }

          return false;
        },
        key: ValueKey<int>(index),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
              size: 50,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? "",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: null,
                          style: IconButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: backGroundColor),
                          icon: Icon(Icons.mail, color: Colors.black)),
                      IconButton(
                          onPressed: null,
                          style: IconButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: backGroundColor),
                          icon: Icon(Icons.phone, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  context.push(UserDetailsView(
                    user:user,
                  ));
                },
                style: IconButton.styleFrom(
                    backgroundColor: Colors.black, shape: CircleBorder()),
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )),
          ),
        ));
  }
}
