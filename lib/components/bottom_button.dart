import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  BottomButton({@required this.buttonText, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kBottomTextStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
