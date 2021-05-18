 import 'package:flutter/material.dart';

Widget buildNoInternrtWidget(String message) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              //  style: kMainTextStyle,
            ),
            TextButton(
              onPressed: () {
                // BlocProvider.of<GetPersonsBloc>(context)
                //     .add(RefreshPageEvent());
              },
              child: Text(
                'Try again',
                style: TextStyle(color: Colors.orange, fontSize: 18),
              ),
            )
          ],
        ));
  }