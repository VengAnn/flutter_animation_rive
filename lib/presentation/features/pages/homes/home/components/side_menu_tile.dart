import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/models/rive_assets.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        //
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              //if use not set stle for animition it's already has default style
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive ? 280 : 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF6792FF),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                width: 34,
                height: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
