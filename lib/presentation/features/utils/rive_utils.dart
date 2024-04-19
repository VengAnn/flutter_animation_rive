import 'dart:developer';
import 'package:rive/rive.dart';

class RiveUtils {
 static StateMachineController getRiveInput(Artboard artboard,
      {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    if (controller != null) {
      artboard.addController(controller);
      return controller;
    } else { 
      log("Failed to create StateMachineController from the artboard.");
      throw Exception('Failed to create StateMachineController from the artboard.');
     
    }
  }

  static void changeSMIBoolState(SMIBool input) {
    input.change(true);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        input.change(false);
      },
    );
  }
}
