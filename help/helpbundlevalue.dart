import 'package:flutter/material.dart';

class HelpvalBundle {
  final int id;
  final String title, description;
  final Color color;

  HelpvalBundle(
      {required this.id,
        required this.title,
        required this.description,
        required this.color});
}

// Demo list
List<HelpvalBundle> helpBundles = [
  HelpvalBundle(
    id: 1,
    title: "App crashing?",
    description: "Try restarting the application",
    color: const Color(0xFF868080),
  ),
  HelpvalBundle(
    id: 2,
    title: "Needs any improvements?",
    description: "Feel free to contact us!!",
    color: const Color(0xFF90AF17),
  ),
  HelpvalBundle(
    id: 3,
    title: "How to purchase super plan?",
    description: "Its easy, just pay",
    color: const Color(0xFF2DBBD8),
  ),
];