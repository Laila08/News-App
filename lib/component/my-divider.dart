
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 1.0,
      ),
    );

  }

}