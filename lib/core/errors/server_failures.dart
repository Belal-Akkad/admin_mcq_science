import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class ServerFailures {
  final String errMessage;

  ServerFailures({required this.errMessage});
}

class ServerAuthFailures extends ServerFailures {
  ServerAuthFailures({required super.errMessage});

  factory ServerAuthFailures.formAuthException(AuthException authException) {
    if (authException.message == 'Invalid login credentials') {
      return ServerAuthFailures(
          errMessage: 'هناك خطأ في البريد الإلكتروني أو كلمة المرور');
    } else if (authException.message ==
        'Password should be at least 6 characters.') {
      return ServerAuthFailures(
          errMessage: 'كلمة مرور ضعيفة، يجب أن تتكون من 6 أحرف على الأقل');
    } else if (authException.message == 'User already registered') {
      return ServerAuthFailures(
          errMessage: 'عنوان البريد الإلكتروني مسجل بالفعل');
    } else if (authException.message ==
        'Unable to validate email address: invalid format') {
      return ServerAuthFailures(errMessage: 'تنسيق البريد الإلكتروني غير صالح');
    } else {
      return ServerAuthFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا');
    }
  }
}

class ServerPostgrestFailures extends ServerFailures {
  ServerPostgrestFailures({required super.errMessage});

  factory ServerPostgrestFailures.fromPostgrestException(
      PostgrestException postgrestException) {

    if (postgrestException.message.contains(
        'duplicate key value violates unique constraint "exams_exam_name_key"')) {
      return ServerPostgrestFailures(errMessage: 'هذا الاسم موجود بالفعل');
    } else if (postgrestException.message.contains(
        'duplicate key value violates unique constraint "questions_question_text_key"')) {
      return ServerPostgrestFailures(
          errMessage: 'This Question Is Already Exists');
    } else if (postgrestException.message.contains(
        'duplicate key value violates unique constraint "users_email_key"')) {
      return ServerPostgrestFailures(
          errMessage: 'عنوان البريد الإلكترونى مسجل بالفعل');
    } else {
      return ServerPostgrestFailures(
          errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا');
    }
  }
}

class ServerSocketFailures extends ServerFailures {
  ServerSocketFailures({required super.errMessage});
  factory ServerSocketFailures.fromSocketFailures(
      SocketException socketException) {
  
    if (socketException.message.contains('Failed host lookup')) {
      return ServerSocketFailures(errMessage: 'تحقق من اتصالك بالإنترنت');
    } else {
      return ServerSocketFailures(errMessage: 'حدث خطأ، يرجى المحاولة لاحقًا');
    }
  }
}
