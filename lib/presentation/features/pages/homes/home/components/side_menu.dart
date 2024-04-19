import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/components/infor_menu.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/components/side_menu_tile.dart';
import 'package:flutter_animation/presentation/features/utils/rive_utils.dart';
import 'package:flutter_animation/presentation/models/rive_assets.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 280,
        height: MediaQuery.of(context).size.height,
        color: const Color(0XFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InforMenu(name: 'Veng Ann', profession: "Dev"),
              //text Browser
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Browser".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white24,
                  ),
                ),
              ),
              //Here is body in menu drawerBar
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (Artboard artboard) {
                    //when click show animition on icon let's do it
                    StateMachineController controller = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    // when tap or click show animition
                    menu.input!.change(true);
                    //we need close animition after 1s
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectMenu = menu;
                    });
                  },
                  isActive: selectMenu == menu,
                ),
              ),
              //Text History
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "History".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white24,
                  ),
                ),
              ),
              //sideMenu 2
              //Here is body in menu drawerBar
              ...sideMenus2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (Artboard artboard) {
                    //when click show animition on icon let's do it
                    StateMachineController controller = RiveUtils.getRiveInput(
                        artboard,
                        stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    // when tap or click show animition
                    menu.input!.change(true);
                    //we need close animition after 1s
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectMenu = menu;
                    });
                  },
                  isActive: selectMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
