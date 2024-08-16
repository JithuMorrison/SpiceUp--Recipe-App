import 'package:flutter/material.dart';
import 'package:recipe_app/easy.dart';
import 'package:recipe_app/innovative.dart';
import 'package:recipe_app/latest.dart';
import 'package:recipe_app/models/recipe_bundle.dart';
import 'package:recipe_app/size_config.dart';

import 'categories.dart';
import 'recipebundlecard.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Categories(),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                  SizeConfig.orientation == Orientation.landscape
                      ? SizeConfig.defaultSize! * 2
                      : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeBundelCard(
                  recipeBundle: recipeBundles[index],
                  press: () {
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Innovative()));
                    }
                    if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Latest()));
                    }
                    if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Easy()));
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