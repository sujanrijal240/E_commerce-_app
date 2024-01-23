import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app1/Responsive_Layout/Mobile_Layout/LoginPage/Utils/buttontext.dart';
import 'package:first_app1/Responsive_Layout/Mobile_Layout/LoginPage/Utils/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> registration() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('no user found on that email');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'no user found on that email',
              style: TextStyle(fontSize: 18.0, color: Colors.amber),
            )));
      } else if (e.code == 'wrong-password') {
        print('wrong password provide by the user');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'wrong password provide by the user',
              style: TextStyle(fontSize: 18.0, color: Colors.amber),
            )));
      }
    }
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spaceHeight = MediaQuery.of(context).size.height;
    final spaceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff2a2d32),
      // backgroundColor: const Color(0xfff39f0b),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: spaceHeight * 0.3,
              color: const Color(0xff2a2d32),
            ),
            Positioned(
              left: 36,
              top: 30,
              child: Text(
                "Namaste\nNepali Palace",
                style: GoogleFonts.getFont(
                  'Lato',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xfff39f0b),
                ),
              ),
            ),
            Positioned(
                bottom: -75,
                child: Stack(
                  children: [
                    Positioned(
                      left: -20,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/burger.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/meat.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/meal.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 70,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/burger.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/meat.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -50,
                      bottom: 15,
                      child: Align(
                        child: SizedBox(
                          width: spaceWidth * 0.3,
                          height: spaceHeight * 0.2,
                          child: Image.asset(
                            'assets/images/meal.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: spaceWidth,
                      height: spaceHeight * 0.4,
                    )
                  ],
                  // scrollDirection: Axis.horizontal,
                )),
          ],
        ),
        Container(
          width: spaceWidth,
          height: spaceHeight * 0.68,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(0xfff39f0b),
          ),
          child: Column(
            children: [
              SizedBox(
                width: spaceWidth,
                height: spaceHeight * 0.05,
              ),
              Center(
                child: Text(
                  "LOG IN",
                  style: GoogleFonts.getFont(
                    'Lato',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff2a2d32),
                  ),
                ),
              ),
              SizedBox(
                width: spaceWidth,
                height: spaceHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    MytextformField(
                      controller: usernamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter username";
                        } else if (!value.contains('@')) {
                          return "Enter Correct Email";
                        }
                        return null;
                      },
                      name: "Gmail",
                      obsecuredtext: false,
                      suffixedIcon: const Icon(
                        Icons.mail_outline,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      height: spaceHeight * 0.02,
                    ),
                    MytextformField(
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter Password";
                        }

                        return null;
                      },
                      name: "Password",
                      obsecuredtext: true,
                      suffixedIcon: const Icon(
                        Icons.visibility_off,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      height: spaceHeight * 0.001,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 48, 0, 180)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: spaceHeight * 0.05,
                    ),
                    Mybuttonfield(
                      onpressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = usernamecontroller.text;
                            password = passwordcontroller.text;
                          });
                          // userLogin();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
