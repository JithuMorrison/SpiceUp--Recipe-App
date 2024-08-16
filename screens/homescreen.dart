
import 'package:flutter/material.dart';
import 'package:recipe_app/components/mybottomnavbar.dart';
import 'package:recipe_app/screens/components/body.dart';
import 'package:recipe_app/searchrecipe.dart';
import 'package:recipe_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      // We are not able to BottomNavigationBar because the icon parameter dont except SVG
      // We also use Provied to manage the state of our Nav
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      // On Android by default its false
      centerTitle: true,
      title: Image.network('ImgSrc'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Search()));
          },
        ),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: SizeConfig.defaultSize! * 0.5,
        )
      ],
    );
  }
}