import 'package:admin_quiz/core/constants/app_asset.dart';
import 'package:flutter/material.dart';

class ScreenBackgroundImage extends StatelessWidget {
  const ScreenBackgroundImage({
    super.key,
    required this.screen,
  });
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAsset.kBackgroundImage,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: screen,
    );
  }
}
