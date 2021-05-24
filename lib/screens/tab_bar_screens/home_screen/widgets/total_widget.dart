import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/icons.dart';
import 'package:rick_and_morty/theme/color_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTotalWidget extends StatefulWidget {
  final String totalPersons;
  final Function onPressButton;

  const CustomTotalWidget({Key key, this.totalPersons, this.onPressButton})
      : super(key: key);

  @override
  _CustomTotalWidgetState createState() => _CustomTotalWidgetState();
}

class _CustomTotalWidgetState extends State<CustomTotalWidget> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Всего персонажей: ${widget.totalPersons}",
            style: TextStyle(color: ColorPalette.greyColor_1),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: SvgPicture.asset(isGrid ? MainIcons.list : MainIcons.grid),
              onPressed: () {
                setState(
                  () {
                    isGrid = !isGrid;
                  },
                );
                widget.onPressButton();
              },
            ),
          )
        ],
      ),
    );
  }
}
