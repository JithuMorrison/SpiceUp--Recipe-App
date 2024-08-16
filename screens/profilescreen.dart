import 'package:flutter/material.dart';
import 'package:recipe_app/components/mybottomnavbar.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/screens/components/bodyy.dart';
import 'package:recipe_app/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: const SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: const Text("Profile"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.defaultSize! * 1.6, //16
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}