import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottonNavsAssetsList = [
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Timer"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notification"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];

//list for menu drawerBar
List<RiveAsset> sideMenus = [
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorite",
  ),
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

//list for menu drawerBar2
List<RiveAsset> sideMenus2 = [
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Help",
  ),
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
];
