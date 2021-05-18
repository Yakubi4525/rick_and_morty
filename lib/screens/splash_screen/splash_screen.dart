import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/image.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorPalette.darkBlue,
        child: Stack(
          children: [
            Image.asset(
              Images.bg,
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            Container(
              height: size.height,
              width: size.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    height: 180,
                    child: Image.asset(Images.rickText),
                    top: 23.92,
                  ),
                  Positioned(
                    height: 43,
                    child: Image.asset(Images.andText),
                    top: 180.7,
                  ),
                  Positioned(
                    height: 160,
                    child: Image.asset(Images.mortyText),
                    top: 200.28,
                  ),
                ],
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              child: Stack(alignment: Alignment.topCenter, children: [
                Positioned(
                  height: 140,
                  child: Image.asset(Images.morty),
                  bottom: 154.73,
                ),
                Positioned(
                  height: 180,
                  child: Image.asset(Images.rick),
                  bottom: 0,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
