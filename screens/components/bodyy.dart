import 'package:flutter/material.dart';
import 'package:recipe_app/help/help.dart';
import 'package:recipe_app/size_config.dart';
import 'package:recipe_app/widgets/savedrecipe.dart';

import 'info.dart';
import 'profilemenuitem.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Info(
            image: "ImgSrc",
            name: "Jithu",
            email: "Jithus2004@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize! * 2), //20
          ProfileMenuItem(
            iconSrc: const Icon(Icons.bookmark),
            title: "Saved Recipes",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Saved()));
            },
          ),
          ProfileMenuItem(
            iconSrc: const Icon(Icons.payment),
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: const Icon(Icons.language),
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: const Icon(Icons.info),
            title: "Help",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Help()));
            },
          ),
        ],
      ),
    );
  }
}