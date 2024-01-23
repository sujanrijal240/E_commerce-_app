import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app1/Responsive_Layout/Mobile_Layout/Router/provider_router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({super.key});

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      GoRouter.of(context).pushNamed(MyAppRouterName.onboardingPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Lottie.network(
                'https://lottie.host/47689cfb-c7a8-4a7f-9775-392be4a70362/WWMIhCNrAs.json',
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText('Namaste Nepali Palace',
                    duration: const Duration(seconds: 5),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      )),
    );
  }
}
