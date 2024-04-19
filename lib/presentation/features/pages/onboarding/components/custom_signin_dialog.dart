import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/onboarding/components/sign_in_form.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSignInDialog(BuildContext context,
      {required ValueChanged onClosed}) {
    return showGeneralDialog(
      // let's close it while tap outside of dialog
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      //sign form
                      const SignInForm(),
                      //some space
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(child: Divider(thickness: 2)),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 5.0,
                              right: 5.0,
                            ),
                            child: Text(
                              "OR",
                              style: TextStyle(),
                            ),
                          ),
                          Expanded(child: Divider(thickness: 2)),
                        ],
                      ),
                      //
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Sign up with Email, Apple or Google",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      //three icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              width: 64,
                              height: 64,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              width: 64,
                              height: 64,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              width: 64,
                              height: 64,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: -22,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).then(onClosed);
  }