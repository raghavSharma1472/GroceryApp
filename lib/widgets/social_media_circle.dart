import 'package:flutter/material.dart';

class SocialMediaCircle extends StatelessWidget {
  final IconData containedIcon;
  final mainColor;
  final borderColor;
  final iconColor;
  Function onPressed;
  SocialMediaCircle({this.containedIcon, this.onPressed,this.borderColor,this.iconColor,this.mainColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: borderColor,
          )),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          containedIcon,
          color: iconColor,
        ),
      ),
    );
  }
}
