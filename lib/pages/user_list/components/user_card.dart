import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/pages/user_list/components/alert_dialog.dart';
import 'package:sprints_profile_management_project/theme/app_colors.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.index});

  final int index;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment(-1, 0),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
        child: const Icon(Icons.delete),
      ),
      onDismissed: (direction) {
        showDialog(
          context: context, 
          builder: (context) => DeleteAlert()
        );
      },
      key: ValueKey<int>(items[widget.index]), 
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.itemsColors[widget.index % AppColors.itemsColors.length],
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.01),
        ),
        child: ListTile(
          minTileHeight: MediaQuery.of(context).size.height*0.15,
          leading: Icon(
            Icons.person,
            color: Colors.black,
            size: MediaQuery.of(context).size.height*0.1,
          ),
          title: Column(
            children: [
              Text(
                "Item ${items[widget.index]}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.25,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.5),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        },
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColors.itemsColors[widget.index % AppColors.itemsColors.length]
                        ),
                        icon: Icon(
                          Icons.mail,
                          color: Colors.black
                        )
                      ),
                      IconButton(
                        onPressed: () {
                          
                        },
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColors.itemsColors[widget.index % AppColors.itemsColors.length]
                        ),
                        icon: Icon(
                          Icons.phone,
                          color: Colors.black
                        )
                      ),
                    ],
                  )
                )
              )
            ],
          ),
          trailing: IconButton(
            onPressed: () {
        
            }, 
            style: IconButton.styleFrom(
              backgroundColor: Colors.black,
              shape: CircleBorder()
            ),
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ),
        ),
      )
    );
  }
}