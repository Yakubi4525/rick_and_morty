import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:rick_and_morty/theme/text_theme.dart';

class EnterWidget extends StatelessWidget {

  final String keyText;
  final String value;

  const EnterWidget({Key key, this.keyText, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(keyText,
                  style: TextThemes.genderPersonTextStyle),
              Text(value,
                  style: TextThemes.h3textStyle)
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: ColorPalette.white)
        ],
      ),
    );
  }
}

