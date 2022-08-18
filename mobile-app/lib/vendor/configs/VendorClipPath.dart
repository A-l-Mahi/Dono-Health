import 'package:flutter/material.dart';

class VendorClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.6177698);
    path_0.cubicTo(
        size.width,
        size.height * 0.7529712,
        size.width,
        size.height * 0.8205755,
        size.width * 0.9820507,
        size.height * 0.8720288);
    path_0.cubicTo(
        size.width * 0.9669251,
        size.height * 0.9153921,
        size.width * 0.9431860,
        size.height * 0.9507446,
        size.width * 0.9140676,
        size.height * 0.9732698);
    path_0.cubicTo(size.width * 0.8795169, size.height, size.width * 0.8341208,
        size.height, size.width * 0.7433333, size.height);
    path_0.lineTo(size.width * 0.2566667, size.height);
    path_0.cubicTo(size.width * 0.1658783, size.height, size.width * 0.1204841,
        size.height, size.width * 0.08593164, size.height * 0.9732698);
    path_0.cubicTo(
        size.width * 0.05681449,
        size.height * 0.9507446,
        size.width * 0.03307367,
        size.height * 0.9153921,
        size.width * 0.01794857,
        size.height * 0.8720288);
    path_0.cubicTo(0, size.height * 0.8205755, 0, size.height * 0.7529712, 0,
        size.height * 0.6177698);
    path_0.lineTo(0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
