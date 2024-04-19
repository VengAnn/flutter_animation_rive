import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/homes/entrypoint/components/animated_bar.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/components/side_menu.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/home_page.dart';
import 'package:flutter_animation/presentation/features/utils/constants.dart';
import 'package:flutter_animation/presentation/features/utils/rive_utils.dart';
import 'package:flutter_animation/presentation/models/rive_assets.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  // initialize it equal the first index obj of RiveAsset
  RiveAsset selectBottonNavsIndex = bottonNavsAssetsList.first;

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  int _selectedIndexIconBottonNavs = 0;

  List<Widget> screens = [
    const HomePage(),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.amber,
    ),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.brown,
    ),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.pink,
    ),
    Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
    ),
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      // two propety special for set sideMenu show full hiegth
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          // let's add sideBarMenu
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 280,
            left: scalAnimation.value,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            // use Transform to see 3D
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              // we rotate 30 degree
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 260, 0),
              child: Transform.scale(
                scale: isSideMenuClosed ? 1 : 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // this here current index of selected in bottonNavigationBar
                  child: screens[_selectedIndexIconBottonNavs],
                ),
              ),
            ),
          ),
          _selectedIndexIconBottonNavs == 0
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isSideMenuClosed ? 0 : 220,
                  curve: Curves.fastOutSlowIn,
                  top: 16,
                  child: MenuBtn(
                    riveOnInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveInput(artboard,
                              stateMachineName: "State Machine");

                      isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                      isSideBarClosed.value = true;
                    },
                    press: () {
                      isSideBarClosed.value = !isSideBarClosed.value;
                      if (isSideMenuClosed) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      setState(() {
                        isSideMenuClosed = isSideBarClosed.value;
                      });
                    },
                  ),
                )
              // index = 0 show icon SideMenu otherwise don't show it
              : const Text(""),
        ],
      ),
      // bottom Nav
      bottomNavigationBar: Transform.translate(
        // use Transform.translate to hide buttonNavigationBar when open SideBar Menu
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Let's add icon rive animation
                ...List.generate(
                  bottonNavsAssetsList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      print("icon pressed $index");
                      bottonNavsAssetsList[index].input!.change(true);
                      if (bottonNavsAssetsList[index] !=
                          selectBottonNavsIndex) {
                        setState(() {
                          selectBottonNavsIndex = bottonNavsAssetsList[index];
                          _selectedIndexIconBottonNavs = index;
                        });
                      }
                      // delay a little then close animition
                      Future.delayed(const Duration(seconds: 2), () {
                        bottonNavsAssetsList[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // animatedBar
                        AnimatedBar(
                          isActive: bottonNavsAssetsList[index] ==
                              selectBottonNavsIndex,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottonNavsAssetsList[index] ==
                                    selectBottonNavsIndex
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              // Src is the same for all , so get only first
                              bottonNavsAssetsList.first.src,
                              artboard: bottonNavsAssetsList[index].artboard,
                              onInit: (artboard) {
                                // ignore: avoid_print
                                print('Artboard initialized: ${artboard.name}');

                                StateMachineController controller =
                                    RiveUtils.getRiveInput(artboard,
                                        stateMachineName:
                                            bottonNavsAssetsList[index]
                                                .stateMachineName);

                                bottonNavsAssetsList[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key,
    required this.press,
    required this.riveOnInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(left: 16, top: 5),
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
