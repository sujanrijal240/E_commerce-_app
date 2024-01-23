import 'package:first_app1/Responsive_Layout/Mobile_Layout/LoginPage/login_page_main.dart';
import 'package:first_app1/Responsive_Layout/Mobile_Layout/Onbording_Screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:namastenepaliplace/mobileBody.dart';

import '../../Tablet_layout/tabletBody.dart';
import '../../responsive.dart';
import '../mobileBody.dart';
// import 'package:namastenepaliplace/Router/provider_router_name.dart';
// import 'package:namastenepaliplace/responsive.dart';
// import 'package:namastenepaliplace/tabletBody.dart';

class MyRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: 'mainpage',
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(
            child:
                // OnboardingScreen()
                // );
                ResponsiveLayout(
                    mobileBody: MyMobileBody(), tabletBody: MyTabletBody()));
      },
    ),
    GoRoute(
      name: 'onboarding',
      path: '/onboarding',
      pageBuilder: (context, state) {
        return const MaterialPage(child: OnboardingScreen());
      },
    ),
    GoRoute(
      name: 'homePage',
      path: '/homePage',
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
    ),
  ]);
}
