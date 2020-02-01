import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap,this.textButton});
  final Function onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(child: Text(
          textButton,
          style: buttonStyle,)
        ),
        color: bottomCard,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: containerHeight,
      ),
    );
  }
}