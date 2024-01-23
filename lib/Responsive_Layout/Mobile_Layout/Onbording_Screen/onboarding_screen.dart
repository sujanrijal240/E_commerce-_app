import 'package:first_app1/Responsive_Layout/Mobile_Layout/LoginPage/login_page_main.dart';
import 'package:first_app1/Responsive_Layout/Mobile_Layout/Router/provider_router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  bool isLastPage = false;
  bool _isOnboardingCompleted = false;

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
    setState(() {
      _isOnboardingCompleted = onboardingCompleted;
    });
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    GoRouter.of(context).pushNamed(MyAppRouterName.homePageRoute);

    @override
    void dispose() {
      controller.dispose();
      super.dispose;
    }
  }

  @override
  Widget build(BuildContext context) {
    // var _space = MediaQuery.of(context).size;

    var spaceHeight = MediaQuery.of(context).size.height;
    var spaceWidth = MediaQuery.of(context).size.width;
    return _isOnboardingCompleted
        ? const HomePage()
        : Scaffold(
            body: Container(
              padding: const EdgeInsets.only(bottom: 50),

              // onboardingscreen11T3 (6:2)

              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.173, 1),
                  end: Alignment(0.173, -1),
                  colors: <Color>[Color(0xfff39f0b), Color(0xff2a2d32)],
                  stops: <double>[0, 1],
                ),
              ),
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                controller: controller,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: spaceHeight * 0.1,
                      ),
                      SizedBox(
                        // autogroupbxwbDJD (Tf3Cvh6cDEhZoeCvVuBXwb)

                        width: double.infinity,
                        height: spaceHeight * 0.56,

                        child: Stack(
                          children: [
                            // bottomm container
                            Positioned(
                              // rectangle2Y5b (7:10)
                              left: 215,
                              bottom: 20,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.6,
                                  height: spaceHeight * 0.2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // top container
                            Positioned(
                              // rectangle11js (6:5)
                              left: -25,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.4,
                                  height: spaceHeight * 0.2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(28),
                                        bottomRight: Radius.circular(28),
                                        bottomLeft: Radius.circular(28),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // top image

                            Positioned(
                              // restaurantsmin1WwX (6:3)
                              left: -25,

                              top: 20,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.5,
                                  height: spaceHeight * 0.25,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      topRight: Radius.circular(26),
                                      bottomRight: Radius.circular(26),
                                      bottomLeft: Radius.circular(26),
                                    ),
                                    child: Image.asset(
                                      'assets/images/table-booking.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //bottom immage
                            Positioned(
                              // tablebooking1cjf (7:6)
                              left: 200,

                              bottom: 50,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.6,
                                  height: spaceHeight * 0.25,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      bottomRight: Radius.circular(22),
                                      bottomLeft: Radius.circular(22),
                                    ),
                                    child: Image.asset(
                                      'assets/images/table-booking.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spaceHeight * 0.05,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(27, 0, 16, 10),
                        width: double.infinity,
                        child: Text(
                          "BOOK YOUR \nTABLE IN A FEW\nCLICK",
                          style: GoogleFonts.getFont('Lato',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2a2d32)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(27, 0, 16, 0),
                        width: double.infinity,
                        child: Text(
                          "We’re sure to give you what you deserve.",
                          style: GoogleFonts.getFont('Lato',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2a2d32)),
                        ),
                      ),
                      // SizedBox(
                      //   height: _spaceHeight * 0.1,
                      // ),
                    ],
                  ),

                  //Second pageController
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: spaceHeight * 0.1,
                      ),
                      SizedBox(
                        // autogroupbxwbDJD (Tf3Cvh6cDEhZoeCvVuBXwb)
                        // margin: EdgeInsets.fromLTRB(0, 0, 0, 20.34),
                        width: double.infinity,
                        height: spaceHeight * 0.56,
                        child: Stack(
                          children: [
                            // top container
                            Positioned(
                              // rectangl e2Y5b (7:10)
                              left: 200,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.6,
                                  height: spaceHeight * 0.2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(4),
                                        bottomRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // bottom container
                            Positioned(
                              // rectangle11js (6:5)
                              left: -25,
                              bottom: 30,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.4,
                                  height: spaceHeight * 0.2,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(28),
                                        bottomRight: Radius.circular(28),
                                        bottomLeft: Radius.circular(28),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // botttom image

                            Positioned(
                              // restaurantsmin1WwX (6:3)
                              left: -25,

                              bottom: 50,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.5,
                                  height: spaceHeight * 0.25,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      topRight: Radius.circular(26),
                                      bottomRight: Radius.circular(26),
                                      bottomLeft: Radius.circular(26),
                                    ),
                                    child: Image.asset(
                                      'assets/images/Food.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //top immage
                            Positioned(
                              // tablebooking1cjf (7:6)
                              left: 175,

                              top: 20,
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.6,
                                  height: spaceHeight * 0.25,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      bottomRight: Radius.circular(22),
                                      bottomLeft: Radius.circular(22),
                                    ),
                                    child: Image.asset(
                                      'assets/images/restaurants-min.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spaceHeight * 0.05,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(27, 0, 16, 10),
                        width: double.infinity,
                        child: Text(
                          "DISCOVER AND \nBOOK THE BEST \nFOOD",
                          style: GoogleFonts.getFont('Lato',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2a2d32)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(27, 0, 16, 0),
                        width: double.infinity,
                        child: Text(
                          "We’re sure to give you what you deserve.",
                          style: GoogleFonts.getFont('Lato',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff2a2d32)),
                        ),
                      ),
                    ],
                  ),

                  //Third PageController
                  SizedBox(
                    height: spaceHeight,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            //black colors container with borderradius
                            Container(
                              height: spaceHeight * 0.58,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(150)),
                                color: Color(0xff2a2d32),
                              ),
                            ),
                            //image positon
                            Positioned(
                              // restaurantsmin1WwX (6:3)

                              bottom: 0,
                              left: 85,
//Alignment
                              child: Align(
                                child: SizedBox(
                                  width: spaceWidth * 0.5,
                                  height: spaceHeight * 0.3,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      topRight: Radius.circular(26),
                                      bottomRight: Radius.circular(26),
                                      bottomLeft: Radius.circular(26),
                                    ),
                                    child: Image.asset(
                                      'assets/images/pizza.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: spaceHeight * 0.15,
                        ),
                        //Text Container
                        Container(
                          margin: const EdgeInsets.fromLTRB(27, 0, 16, 10),
                          width: double.infinity,
                          child: Text(
                            "NAMASTE \nNEPALI PALACE",
                            style: GoogleFonts.getFont('Lato',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff2a2d32)),
                          ),
                        ),
                        //Small text Container
                        Container(
                          margin: const EdgeInsets.fromLTRB(27, 0, 16, 0),
                          width: double.infinity,
                          child: Text(
                            "We’re sure to give you what you deserve.",
                            style: GoogleFonts.getFont('Lato',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff2a2d32)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //bottom container
            bottomSheet: isLastPage
                ? Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey,
                    ),
                    child: TextButton(
                      onPressed: () {
                        _completeOnboarding();
                        //Home Page Router
                        GoRouter.of(context)
                            .pushNamed(MyAppRouterName.homePageRoute);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => HomePage()));
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                            color: Color(0xff2a2d32),
                            fontWeight: FontWeight.bold),
                      ),
                      // style: TextButton.styleFrom(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(25)),
                      //   primary: Colors.white,
                      //   backgroundColor: Colors.blueGrey,
                      //   shadowColor: Colors.black,
                      // ),
                    ),
                  )
                : Container(
                    color: Colors.orangeAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                                color: Color(0xff2a2d32),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: const WormEffect(
                                spacing: 15,
                                dotColor: Color.fromARGB(255, 70, 70, 71),
                                activeDotColor: Colors.deepOrange),
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Color(0xff2a2d32),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ),
                  ),
          );
  }
}

  // Future setSeenonbording() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   seenOnbording = await prefs.setBool('seenOnboard', true);
  // }
  // void initState(){

  // }

// Image download
//
//   const Image(
//     image: assetImage(
//         'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
//   ),
//   ElevatedButton(
//     onPressed: () async {
//       String url =
//           'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg';
//       await GallerySaver.saveImage(
//         url,
//         toDcim: true,
//       );
//     },
//     child: const Text("Save Image"),
