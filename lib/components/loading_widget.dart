import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class CustomLoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25.0,
              width: 25.0,
              child: CupertinoActivityIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
