import 'package:fintech_app/app/mobile/nav.dart';
import 'package:fintech_app/app/web/nav_web.dart';
import 'package:flutter/material.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return NavScreen(
            constraints: constraints,
          );
        } else {
          return NavWeb(constraints: constraints);
        }
      },
    );
  }
}
