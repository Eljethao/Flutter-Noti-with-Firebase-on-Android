import 'package:flutter/material.dart';

class NotiDialog {
  final BuildContext context;
  NotiDialog({
    required this.context
  });

  Future<void> myDialog(String title, String body) async {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: ListTile(
        leading: Icon(Icons.notifications),
        title: Text(title),
        subtitle: Text(body),
      ),
    ));
  }
}