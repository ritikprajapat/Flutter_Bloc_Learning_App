import 'package:flutter/material.dart';

class SnackbarHelper {
  static showSnackbar(
    BuildContext context,
    String? message, {
    Color? backgroundColor,
  }) {
    if (message == null || message.isEmpty) {
      return;
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor ?? Colors.black,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
