import 'package:flutter/material.dart';

class SocialMediaCircle extends StatelessWidget {
  final IconData containedIcon;
  SocialMediaCircle(this.containedIcon);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: Colors.blue,
          )),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          containedIcon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
