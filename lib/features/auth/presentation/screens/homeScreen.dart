import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/widget/custom_button.dart';
import '../../../../core/widget/constant/colors.dart';

class HomeSreen extends StatelessWidget {
  static const String route = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          CustomPaint(
            painter: ArcPaint(),
            child: SizedBox(
              height: mediaQuery.height * 0.74, // ≈ height / 1.35
              width: mediaQuery.width,
            ),
          ),
          CustomButton(
            buttonText: 'Sign In',
            backColor: Colors.blue,
            bonPressed: () {
              Navigator.pushNamed(context, "SignInScreen");
            },
            foreColor: Colors.white,
          ),
          SizedBox(
            height: mediaQuery.height * 0.02, // 2% of screen height
          ),
          CustomButton(
            buttonText: 'Log In',
            backColor: Colors.white,
            bonPressed: () {
              Navigator.pushNamed(context, 'LoginScreen');
            },
            foreColor: mainColor,
          ),
        ],
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double arcHeight = size.height * 0.25; // previously 250

    Path whiteArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - arcHeight)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - arcHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
