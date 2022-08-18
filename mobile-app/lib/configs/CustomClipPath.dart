import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0041667, size.height * 0.0028571);
    path0.quadraticBezierTo(size.width * 0.0016667, size.height * 0.4785714,
        size.width * 0.0008333, size.height * 0.6371429);
    path0.quadraticBezierTo(size.width * 0.2359000, size.height * 0.9656143,
        size.width * 0.4991667, size.height * 0.9914286);
    path0.quadraticBezierTo(size.width * 0.7987833, size.height * 0.9595714,
        size.width * 0.9966667, size.height * 0.6357143);
    path0.lineTo(size.width * 0.9975000, size.height * 0.0028571);
    path0.quadraticBezierTo(size.width * 0.7491667, size.height * 0.0028571,
        size.width * 0.0041667, size.height * 0.0028571);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
