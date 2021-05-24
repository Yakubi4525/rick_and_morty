import 'package:flutter/material.dart';

class CustomNoInternetWidget extends StatelessWidget {
  final String message;

  const CustomNoInternetWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Try again',
              style: TextStyle(color: Colors.orange, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
