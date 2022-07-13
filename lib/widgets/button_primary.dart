import 'package:flutter/material.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final double size;
  final FontWeight fontWeight;
  final double width;
  final Function() onPressed;

  const ButtonPrimary({
    Key? key,
    required this.label,
    required this.size,
    required this.fontWeight,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 46,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: onPressed,
        child: textPoppins(
          label,
          size,
          Colors.white,
          fontWeight,
        ),
      ),
    );
  }
}
