import 'package:admin_quiz/core/constants/app_color.dart';
import 'package:admin_quiz/core/enum/auth_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.textFieldType,
    this.passwordController,
    this.onSaved,
  });
  final AuthTextFieldType textFieldType;
  final TextEditingController? passwordController;
  final Function(String?)? onSaved;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool obscureText = false;

  @override
  void initState() {
    if (_isPasswordField()) {
      obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getResponsiveSize(context, 10)),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        style: AppStyles.semiBoldTextStyle16(context),
        onSaved: widget.onSaved,
        validator: _validator,
        cursorColor: AppColor.kWhiteColor,
        decoration: _buildInputDecoration(),
        obscureText: obscureText,
        controller: _getController(),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColor.kMidnightBlue,
      contentPadding: EdgeInsets.symmetric(
        vertical: getResponsiveSize(context, 15),
        horizontal: getResponsiveSize(context, 15),
      ),
      labelText: _getLabelText(),
      suffixIcon: _getSuffixIcon(),
      errorStyle: AppStyles.mediumTextStyle14(context),
      labelStyle: AppStyles.boldTextStyle16(context),
      suffixIconColor: AppColor.kWhiteColor,
      border: _buildOutLineInputBorder(),
      errorBorder: _buildOutLineInputBorder(color: AppColor.kRedColor),
      focusedErrorBorder: _buildOutLineInputBorder(color: AppColor.kRedColor),
      focusedBorder: _buildOutLineInputBorder(),
      enabledBorder: _buildOutLineInputBorder(),
    );
  }

  Widget _getSuffixIcon() {
    if (_isPasswordField()) {
      return Padding(
        padding: EdgeInsets.only(
          left: getResponsiveSize(context, 10),
        ),
        child: IconButton(
          onPressed: _toggleObscureText,
          icon: obscureText
              ? Icon(Icons.visibility_off, size: getResponsiveSize(context, 25))
              : Icon(Icons.visibility, size: getResponsiveSize(context, 25)),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: getResponsiveSize(context, 10)),
        child: Icon(Icons.email, size: getResponsiveSize(context, 25)),
      );
    }
  }

  TextEditingController? _getController() {
    if (widget.textFieldType == AuthTextFieldType.password) {
      return widget.passwordController;
    } else {
      return null;
    }
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوبه';
    } else if (widget.textFieldType == AuthTextFieldType.confirmPassword &&
        widget.passwordController?.text != value) {
      return 'كلمة المرور غير متطابقة';
    } else if (widget.textFieldType == AuthTextFieldType.password) {
      if (value.contains(' ')) {
        return 'لا ينبغي أن تحتوي كلمة المرور على مسافات';
      } else if (value.length < 6) {
        return 'يجب أن تتكون كلمة المرور من 6 أحرف أو أكثر';
      }
    } else if (widget.textFieldType == AuthTextFieldType.email) {
      RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
      if (!emailRegExp.hasMatch(value)) {
        return 'يرجى إدخال عنوان بريد إلكتروني صالح';
      }
    }

    return null;
  }

  String _getLabelText() {
    switch (widget.textFieldType) {
      case AuthTextFieldType.email:
        return 'بريد إلكتروني';
      case AuthTextFieldType.password:
        return 'كلمة المرور';
      case AuthTextFieldType.confirmPassword:
        return 'تأكيد كلمة المرور';
      default:
        return '';
    }
  }

  OutlineInputBorder _buildOutLineInputBorder(
      {Color color = AppColor.kWhiteColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  bool _isPasswordField() {
    return (AuthTextFieldType.password == widget.textFieldType) ||
        (AuthTextFieldType.confirmPassword == widget.textFieldType);
  }

  void _toggleObscureText() {
    setState(
      () {
        obscureText = !obscureText;
      },
    );
  }
}
