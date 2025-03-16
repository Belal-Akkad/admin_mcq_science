import 'package:admin_quiz/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';


void showStateMessage(String title, String message, BuildContext context) {
  showSnackBar(context, titleText: title, messageText: message);
}
