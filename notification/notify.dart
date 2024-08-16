
import 'package:flutter/material.dart';
import 'package:recipe_app/notification/fase.dart';
import 'package:recipe_app/size_config.dart';

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildBar(context),
      body: const Fase(),
    );
  }

  AppBar buildBar(BuildContext context) {
    return AppBar(
      // On Android by default its false
      centerTitle: true,
      toolbarHeight: 70,
      title: Image.network('ImageSrc'),
    );
  }
}