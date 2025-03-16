import 'package:admin_quiz/core/functions/show_state_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void handleSuccessState(String message, BuildContext context) {
  Get.back();
  showStateMessage('تمت العملية بنجاح', message, context);
}
