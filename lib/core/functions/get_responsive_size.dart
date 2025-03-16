import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, double size) {
  double width = MediaQuery.of(context).size.width;
  double scaleFactor = width / 500;
  double responsiveSize = scaleFactor * size;
  double lowerLimit = size * 0.8;
  double upperLimit = size * 2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}
