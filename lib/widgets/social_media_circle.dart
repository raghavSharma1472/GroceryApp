import 'package:flutter/material.dart';

class SocialMediaCircle extends StatelessWidget {
  final IconData containedIcon;
  Function onPressed;
  SocialMediaCircle({this.containedIcon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Colors.blue,
          )),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          containedIcon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
