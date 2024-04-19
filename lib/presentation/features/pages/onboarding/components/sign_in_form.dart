import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/homes/entrypoint/entry_point.dart';
import 'package:flutter_animation/presentation/features/widgets/text_form_field_widget.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // ignore: unused_field, prefer_final_fields
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  // for rive check.rive it's have three trigger
  late SMITrigger success;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  // ignore: non_constant_identifier_names
  void SignIn(BuildContext context) {
    //first when user tap the sign in button it shows the loading
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          // If everything looks good it shows the success animation
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                // disable loading after 2s
                isShowLoading = false;
              });
              // After closing it show the confetti animation like congratulations
              confetti.fire();
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isShowConfetti = false;
                });
              });
              //once all success we'll navigate to Next screen
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EntryPoint()),
                );
              });
            },
          );
        } else {
          // or error animation
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                // disable loading after 2s
                isShowLoading = false;
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(color: Colors.grey),
              ), //email
              TextFormFieldWidget(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                  return null;
                },
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
              TextFormFieldWidget(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                  return null;
                },
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
                onPressed: () {
                  SignIn(context);
                },
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
          // loading image
          // check.riv it's have 3 trigger
          isShowLoading
              ? CustomPosition(
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/check.riv",
                    onInit: _onCheckRiveInit,
                  ),
                )
              : const SizedBox(),
          // for see animation when email & pass correct like congratulation
          isShowConfetti
              ? CustomPosition(
                  child: Transform.scale(
                    scale: 6,
                    child: RiveAnimation.asset(
                      "assets/RiveAssets/confetti.riv",
                      onInit: _onConfettiRiveInit,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class CustomPosition extends StatelessWidget {
  const CustomPosition({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            width: 100,
            height: 100,
            child: child,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
