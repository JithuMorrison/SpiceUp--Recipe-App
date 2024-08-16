import 'package:flutter/material.dart';
import 'package:recipe_app/Mexican.dart';
import 'package:recipe_app/chinese.dart';

import 'package:recipe_app/constants.dart';
import 'package:recipe_app/italian.dart';
import 'package:recipe_app/size_config.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

// Our Category List need StateFullWidget
// I can use Provider on it, Then we dont need StatefulWidget

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Indian", "Italian", "Mexican", "Chinese"];
  // By default first one is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 3.5, // 35
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        if(index==1) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage1()));
        }
        if(index==2) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Italian()));
        }
        if(index==3) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Mexican()));
        }
        if(index==4) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Chinese()));
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize! * 2, //20
          vertical: SizeConfig.defaultSize! * 0.5, //5
        ),
        decoration: BoxDecoration(
            color:
            selectedIndex == index ? const Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize! * 1.6, // 16
            )),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : const Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}