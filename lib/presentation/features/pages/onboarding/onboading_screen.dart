import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/onboarding/components/animated_btn.dart';
import 'package:flutter_animation/presentation/features/pages/onboarding/components/custom_signin_dialog.dart';
import 'package:rive/rive.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late RiveAnimationController _btnAnimationController;
  // for checking dialog sign in show or close
  bool isSignInDialogShown = false;

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
          // when show dialog set alittle bit text up animated
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
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
                        // we set show dialog it'll true
                        setState(() {
                          isSignInDialogShown = true;
                        });
                        // when click on button i want show dialog for login or something else..
                        // and we need delay to see animation when click on btn
                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            customSignInDialog(
                              context,
                              onClosed: (_) {
                                setState(() {
                                  isSignInDialogShown = false;
                                });
                              },
                            );
                          },
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
          ),
        ],
      ),
    );
  }

}


