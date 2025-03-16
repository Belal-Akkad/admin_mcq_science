import 'package:admin_quiz/features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:admin_quiz/core/widgets/dialog_actions.dart';
import 'package:flutter/material.dart';


class BuildDialogActions extends StatelessWidget {
  const BuildDialogActions({
    super.key,
    required this.isLoading,
    required this.onButtonPressed,
  });
  final bool isLoading;
  final void Function() onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CustomLoadingIndicator())
        : DialogActions(
            onButtonPressed: onButtonPressed,
          );
  }
}
