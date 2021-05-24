import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CupertinoActivityIndicator(),
          )
        ],
      ),
    );
  }
}
