import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/designs/riveassets.dart';
import 'package:recipe_app/designs/riveutils.dart';
import 'package:recipe_app/designs/sidemenu.dart';
import 'package:recipe_app/help/help.dart';
import 'package:recipe_app/notification/notify.dart';
import 'package:recipe_app/searchrecipe.dart';
import 'package:recipe_app/widgets/history.dart';
import 'package:recipe_app/widgets/savedrecipe.dart';

import 'infocard.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Jithu",
                bio: "App Developer",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus
                  .map((menu) => SideMenu(
                menu: menu,
                selectedMenu: selectedSideMenu,
                press: () {
                  RiveUtils.chnageSMIBoolState(menu.rive.status!);
                  setState(() {
                    selectedSideMenu = menu;
                  });
                  if(menu.title=="Search"){
                    Timer(const Duration(seconds: 2), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Search()));
                    });
                  }
                  if(menu.title=="Help"){
                    Timer(const Duration(seconds: 2), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Help()));
                    });
                  }
                  if(menu.title=="Favorites"){
                    Timer(const Duration(seconds: 1), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Saved()));
                    });
                  }
                },
                riveOnInit: (artboard) {
                  menu.rive.status = RiveUtils.getRiveInput(artboard,
                      stateMachineName: menu.rive.stateMachineName);
                },
              ))
                  ,
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus2
                  .map((menu) => SideMenu(
                menu: menu,
                selectedMenu: selectedSideMenu,
                press: () {
                  RiveUtils.chnageSMIBoolState(menu.rive.status!);
                  setState(() {
                    selectedSideMenu = menu;
                  });
                  if(menu.title=="Notifications"){
                    Timer(const Duration(seconds: 1), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notify()));
                    });
                  }
                  if(menu.title=="History"){
                    Timer(const Duration(seconds: 2), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const History()));
                    });
                  }
                },
                riveOnInit: (artboard) {
                  menu.rive.status = RiveUtils.getRiveInput(artboard,
                      stateMachineName: menu.rive.stateMachineName);
                },
              ))
                  ,
            ],
          ),
        ),
      ),
    );
  }
}