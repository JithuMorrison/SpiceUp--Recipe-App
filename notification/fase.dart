import 'package:flutter/material.dart';
import 'package:recipe_app/size_config.dart';

import 'notifybundle.dart';
import 'notifyvalbundle.dart';


class Fase extends StatelessWidget {
  const Fase({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
              child: GridView.builder(
                itemCount: notifyBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                  SizeConfig.orientation == Orientation.landscape
                      ? SizeConfig.defaultSize! * 2
                      : 0,
                  childAspectRatio: 3,
                ),
                itemBuilder: (context, index) => NotifyBundle(
                  recipeBundle: notifyBundles[index],
                  press: () {
                    if(index==0){
                    }
                    if(index==1){
                    }
                    if(index==2){
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}