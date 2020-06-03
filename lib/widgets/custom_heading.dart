import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';

class CustomHeading extends StatelessWidget {
  final String heading;
  final String suffixText;
  final Function onPressedSuffixTextCallback;
  CustomHeading(
      {this.heading, this.suffixText = '', this.onPressedSuffixTextCallback});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          heading,
          style: kHeadingText.copyWith(
              fontWeight: FontWeight.w600, letterSpacing: 0.6),
        ),
        InkWell(
          child: Text(
            suffixText,
            style: kHeadingText.copyWith(
              fontSize: 14.0,
            ),
          ),
          onTap: () {
            //TODO View All Popular Products Page
          },
        )
      ],
    );
  }
}
