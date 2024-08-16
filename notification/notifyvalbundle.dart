import 'package:flutter/material.dart';

class NotifyvalBundle {
  final int id;
  final String title, description;
  final Color color;

  NotifyvalBundle(
      {required this.id,
        required this.title,
        required this.description,
        required this.color});
}

// Demo list
List<NotifyvalBundle> notifyBundles = [
  NotifyvalBundle(
    id: 1,
    title: "New update 1.1.0",
    description: "Introducing interactive start page, sigin, login and sliding pane",
    color: const Color(0xFF868080),
  ),
  NotifyvalBundle(
    id: 2,
    title: "New update 2.0.1",
    description: "Learn the power of AI, now you can generate new recipes using AI",
    color: const Color(0xFF868080),
  ),
  NotifyvalBundle(
    id: 3,
    title: "New Update 2.1.1",
    description: "Introducing super plan and profile updation",
    color: const Color(0xFF868080),
  ),
  NotifyvalBundle(
    id: 4,
    title: "New Update 2.1.5",
    description: "This world shall know the pain? not anymore, Introducing saved recipes, now you can save recipes",
    color: const Color(0xFF868080),
  ),
];