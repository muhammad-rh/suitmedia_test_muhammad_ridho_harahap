import 'package:flutter/material.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: stylePoppins(
        16,
        // const Color.fromRGBO(104, 103, 119, 0.36),
        Colors.black,
        FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(226, 227, 228, 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 227, 228, 1),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 227, 228, 1),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 227, 228, 1),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
