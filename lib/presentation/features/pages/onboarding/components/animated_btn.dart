import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  final RiveAnimationController _btnAnimationController;
  final VoidCallback onPress;

  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.onPress,
  }) : _btnAnimationController = btnAnimationController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on press GestureDetector
      onTap: onPress,
      child: SizedBox(
        width: 260,
        height: 64,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            //
            const Positioned.fill(
              //But it's not center
              top: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  //some space
                  SizedBox(width: 10),
                  //text
                  Text(
                    "Start the course",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
