import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/enum/admin_field_type.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/features/exams/presentation/view/view_model/admin_text_field_model.dart';
import 'package:flutter/material.dart';

class AdminTextFormField extends StatefulWidget {
  const AdminTextFormField({
    super.key,
    required this.model,
  });

  final AdminTextFieldModel model;

  @override
  State<AdminTextFormField> createState() => _AdminTextFormFieldState();
}

class _AdminTextFormFieldState extends State<AdminTextFormField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.model.oldText??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: getKeyBoardType(),
      maxLength: getMaxLength(),
      validator: getValidator,
      
      onSaved: widget.model.onSaved,
      style: AppStyles.normalTextStyle16(context),
      cursorColor: AppColor.kWhiteColor,
      decoration: _inputDecoration(context),
    );
  }

  TextInputType? getKeyBoardType() {
    if (widget.model.adminFieldType ==
            AdminFieldType.addQuestionCorrectAnswer ||
        widget.model.adminFieldType ==
            AdminFieldType.updateQuestionCorrectAnswer) {
      return const TextInputType.numberWithOptions();
    }
    return null;
  }

  String? getValidator(value) {
    if (widget.model.adminFieldType ==
            AdminFieldType.addQuestionCorrectAnswer ||
        (widget.model.adminFieldType ==
                AdminFieldType.updateQuestionCorrectAnswer &&
            value.isNotEmpty)) {
      if (!RegExp(r'^[1-4]$').hasMatch(value)) {
        return 'ادخل رقمًا بين 1 و 4';
      }
    }

    if (![
          AdminFieldType.updateQuestionChoice,
          AdminFieldType.updateQuestionCorrectAnswer,
          AdminFieldType.updateQuestionText,
          AdminFieldType.updateExam,
        ].contains(widget.model.adminFieldType) &&
        (value.isEmpty)) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  int? getMaxLength() {
    if (widget.model.adminFieldType == AdminFieldType.addExam ||
        widget.model.adminFieldType == AdminFieldType.updateExam ||
        widget.model.adminFieldType == AdminFieldType.addQuestionChoice ||
        widget.model.adminFieldType == AdminFieldType.updateQuestionChoice) {
      return 25;
    } else if (widget.model.adminFieldType ==
            AdminFieldType.addQuestionCorrectAnswer ||
        widget.model.adminFieldType ==
            AdminFieldType.updateQuestionCorrectAnswer) {
      return 1;
    } else if (widget.model.adminFieldType == AdminFieldType.addQuestionText ||
        widget.model.adminFieldType == AdminFieldType.updateQuestionText) {
      return 200;
    } else {
      return null;
    }
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      
      counterStyle: AppStyles.mediumTextStyle18(context),
      labelText: widget.model.labelText,
      hintStyle: AppStyles.boldTextStyle14(context),
      labelStyle: AppStyles.boldTextStyle16(context)
          .copyWith(color: AppColor.kGrayColor),
      border: _buildUnderLineInputBorder(),
      errorStyle: AppStyles.mediumTextStyle14(context),
      enabledBorder: _buildUnderLineInputBorder(),
      focusedBorder: _buildUnderLineInputBorder(),
    );
  }

  UnderlineInputBorder _buildUnderLineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
