
import 'package:admin_quiz/core/enum/admin_field_type.dart';

class AdminTextFieldModel {
  final String labelText;
  final String? oldText;
  final void Function(String?) onSaved;
  final AdminFieldType adminFieldType;
  AdminTextFieldModel({
    required this.adminFieldType,
    required this.labelText,
     this.oldText,
    required this.onSaved,
  });
}
