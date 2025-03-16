import 'package:admin_quiz/core/enum/auth_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/widgets/primary_action_button.dart';
import 'package:admin_quiz/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/register_navigation_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? _email;
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Expanded(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: _buildFields() +
                [
                  SizedBox(height: getResponsiveSize(context, 20)),
                  PrimaryActionButton(text: 'تسجيل الدخول', onTap: _login),
                  SizedBox(height: getResponsiveSize(context, 20)),
                  const RegisterNavigationLink(),
                ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFields() {
    return [
      AuthTextFormField(
        onSaved: (value) {
          _email = value;
        },
        textFieldType: AuthTextFieldType.email,
      ),
      AuthTextFormField(
        onSaved: (value) {
          _password = value;
        },
        textFieldType: AuthTextFieldType.password,
      )
    ];
  }

  Future<void> _login() async {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      await BlocProvider.of<LoginCubit>(context)
          .login(email: _email!, password: _password!);
    }
  }
}
