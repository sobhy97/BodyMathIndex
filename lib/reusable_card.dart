import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({@required this.colour,this.cardWidget,this.onPress});
  final Color colour;
  final Widget cardWidget;
  final Function onPress;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colour
        ),
      ),
    );
  }
}