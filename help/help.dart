
import 'package:flutter/material.dart';
import 'package:recipe_app/help/base.dart';
import 'package:recipe_app/size_config.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildBar(context),
      body: const Base(),
    );
  }

  AppBar buildBar(BuildContext context) {
    return AppBar(
      // On Android by default its false
      centerTitle: true,
      toolbarHeight: 100,
      title: Image.network('Img'),
    );
  }
}