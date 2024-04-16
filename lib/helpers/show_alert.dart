import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String subTitle) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subTitle),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('ok'),
                )
              ],
            ));
  }
  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subTitle),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("Ok"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
}
