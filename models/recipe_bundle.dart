import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {required this.id,
        required this.chefs,
        required this.recipes,
        required this.title,
        required this.description,
        required this.imageSrc,
        required this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 7,
    recipes: 5,
    title: "Innovative Recipes",
    description: "New and tasty recipes every minute",
    imageSrc: 'ImageSrc',
    color: const Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 10,
    title: "Best of 2024",
    description: "Lets Cook the latest recipes",
    imageSrc: "ImageSrc",
    color: const Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Easy Recipes",
    description: "What's your favorite food dish make it now",
    imageSrc: "ImageSrc",
    color: const Color(0xFF2DBBD8),
  ),
];