import 'package:flutter/cupertino.dart';

import 'package:instafire/constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //webscren
          return webScreenLayout;
        } else {
          //mobilescreen
          return mobileScreenLayout;
        }
      },
    );
  }
}
