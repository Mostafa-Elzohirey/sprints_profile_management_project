import 'package:flutter/material.dart';

class DeleteAlert extends StatefulWidget {
  const DeleteAlert({super.key});

  @override
  State<DeleteAlert> createState() => _DeleteAlertState();
}

class _DeleteAlertState extends State<DeleteAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.warning,
        size: MediaQuery.of(context).size.height*0.1,
        color: Colors.amber
      ),
      title: Text("Are you sure to delete this user?"),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder()
          ),
          child: Text(
            "Discard",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            )
          )
        ),
        SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder()
          ),
          child: Text(
            "Confirm",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            )
          ),
        )
      ]
    );
  }
}