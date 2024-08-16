import 'package:flutter/material.dart';

import 'generate_file.dart';

class OpenAi extends StatelessWidget {
  const OpenAi({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FLutter Recipe App',
      themeMode: ThemeMode.system,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
