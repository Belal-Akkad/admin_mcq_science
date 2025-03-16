import 'package:admin_quiz/core/enum/auth_field_type.dart';
import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/widgets/primary_action_button.dart';
import 'package:admin_quiz/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:admin_quiz/features/auth/presentation/views/widgets/login_navigation_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey();

  final TextEditingController passwordController = TextEditingController();
  String? _email, _password;
  String role = 'user';
  bool isAdmin = false;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Expanded(
        child: Center(
            child: ListView(
          shrinkWrap: true,
          children: _buildFields() +
              [
                SizedBox(height: getResponsiveSize(context, 20)),
                PrimaryActionButton(onTap: _signUp, text: 'إنشاء'),
                SizedBox(height: getResponsiveSize(context, 20)),
                const LoginNavigationLink(),
              ],
        )),
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
        passwordController: passwordController,
        textFieldType: AuthTextFieldType.password,
      ),
      AuthTextFormField(
        passwordController: passwordController,
        textFieldType: AuthTextFieldType.confirmPassword,
      ),
    ];
  }

  Future<void> _signUp() async {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      BlocProvider.of<RegisterCubit>(context).register(
        email: _email!,
        password: _password!,
      );
    }
  }
}
