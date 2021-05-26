import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';

class TopWidgetsView extends StatelessWidget {
  final String imageUrl;

  const TopWidgetsView({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 54),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            height: 48,
            width: 48,
            child: FloatingActionButton(
              backgroundColor: ColorPalette.secondPrimary,
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        const SizedBox(height: 36),
        Center(
          child: Container(
            width: 146,
            height: 146,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 8, color: ColorPalette.darkBlue)),
            child: FittedBox(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
        )
      ],
    );
  }
}
