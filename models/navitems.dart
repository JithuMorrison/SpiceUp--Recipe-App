import 'package:flutter/material.dart';
import 'package:recipe_app/designs/entrypoint.dart';
import 'package:recipe_app/home.dart';
import 'package:recipe_app/openai/openai.dart';
import 'package:recipe_app/screens/profilescreen.dart';


class NavItem {
  final int id;
  final Icon icon;
  final Widget destination;

  NavItem({required this.id, required this.icon, required this.destination});

  bool destinationChecker() {
    return true;
      return false;
  }
}

class NavItems extends ChangeNotifier {
  int selectedIndex = 0;

  void chnageNavIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: const Icon(Icons.home),
      destination: const EntryPoint(),
    ),
    NavItem(
      id: 2,
      icon: const Icon(Icons.list),
      destination: const HomePage(),
    ),
    NavItem(
      id: 3,
      icon: const Icon(Icons.camera),
      destination: const OpenAi(),
    ),
    NavItem(
      id: 4,
      icon: const Icon(Icons.navigation),
      destination: const EntryPoint(),
    ),
    NavItem(
      id: 5,
      icon: const Icon(Icons.supervised_user_circle),
      destination: const ProfileScreen(),
    ),
  ];
}