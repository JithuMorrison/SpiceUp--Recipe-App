import 'package:flutter/material.dart';
import 'package:recipe_app/notification/notifyvalbundle.dart';


import 'package:recipe_app/size_config.dart';

class NotifyBundle extends StatelessWidget {
  final NotifyvalBundle recipeBundle;
  final Function() press;

  const NotifyBundle({ super.key, required this.recipeBundle,required this.press});
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize! * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      recipeBundle.description,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(width: defaultSize * 0.5), //5

          ],
        ),
      ),
    );
  }


}