import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/onboarding/components/animated_btn.dart';
import 'package:flutter_animation/presentation/features/widgets/text_form_field_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();

    _btnAnimationController = OneShotAnimation("active", autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //add image
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          // blur for background image
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          // add rive image animation
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          // add some blur to rive image animation
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          //let's add text
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        //some space
                        SizedBox(height: 10),
                        //
                        Text(
                          "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                        ),
                      ],
                    ),
                  ),
                  //add spacer
                  const Spacer(flex: 2),
                  //time to add the animated button
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    onPress: () {
                      _btnAnimationController.isActive = true;
                      //when click on button i want show dialog for login or something else..
                      showGeneralDialog(
                        // let's close it while tap outside of dialog
                        barrierDismissible: true,
                        barrierLabel: "Sign In",
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Center(
                          child: Container(
                            height: 620,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 34,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      child: Text(
                                        "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    //sign form
                                    SignInForm(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  //
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(color: Colors.grey),
          ), //email
          const TextFormFieldWidget(
            labelText: "email",
            svgImage: "assets/icons/email.svg",
          ),
          // add some space
          const SizedBox(height: 10),
          //password
          const Text(
            "password",
            style: TextStyle(color: Colors.grey),
          ), //email
          const TextFormFieldWidget(
            labelText: "password",
            svgImage: "assets/icons/password.svg",
          ),
          // add some space
          const SizedBox(height: 10),
          //button sign in
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.arrow_right,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
