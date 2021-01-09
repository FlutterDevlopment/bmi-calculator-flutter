import 'package:flutter/material.dart';
import '../constants.dart';

class IconWidget extends StatelessWidget {
  final String textIcon;
  final IconData icon;
  IconWidget({@required this.textIcon, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(textIcon, style: kTextStyling),
      ],
    );
  }
}
