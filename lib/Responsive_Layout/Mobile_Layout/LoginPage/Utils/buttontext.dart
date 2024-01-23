import 'package:flutter/material.dart';

class Mybuttonfield extends StatelessWidget {
  final onpressed ;
   const Mybuttonfield({super.key,
   required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
          ),
          child: const Center(
           child: Text("Sign In",

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32)),

          ),
        ),
      ),
    );
  }
}
