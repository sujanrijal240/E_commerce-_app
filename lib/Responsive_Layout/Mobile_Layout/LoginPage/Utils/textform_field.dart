import 'package:flutter/material.dart';

class MytextformField extends StatelessWidget {
  final String name;
  final controller;
  final validator;
  final Icon suffixedIcon;
  final bool obsecuredtext;
  const MytextformField({
    super.key,
    required this.name,
    this.validator,
    this.controller,
    required this.obsecuredtext,
    required this.suffixedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obsecuredtext,
        decoration: InputDecoration(
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.yellowAccent)),
            label: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff2a2d32),
              ),
            ),
            suffixIcon: suffixedIcon),
      ),
    );
  }
}
