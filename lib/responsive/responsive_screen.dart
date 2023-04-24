import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveScreen({super.key, required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth > WebScreenSize) {
          return webScreenLayout;
          //web screen
        }
        return mobileScreenLayout;
        //mobile screen
      }
      );
  }
}