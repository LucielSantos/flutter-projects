import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParsedProps {
  String text;
  Color color;
  FontWeight fontWeight;
  double size;

  ParsedProps.create(this.text, this.color, this.fontWeight, this.size);
}

class CustomText extends StatelessWidget {
  String text;
  String variant;

  CustomText(paramText, this.variant) {
    this.text = "$paramText";
  }

  ParsedProps getProps() {
    switch (variant) {
      case 'primary':
        return ParsedProps.create(
          this.text,
          Colors.white,
          FontWeight.normal,
          18,
        );

      case 'secondary':
        return ParsedProps.create(
          this.text,
          Colors.white,
          FontWeight.w600,
          18,
        );

      case 'tertiary':
        return ParsedProps.create(
          this.text,
          Colors.white,
          FontWeight.w600,
          20,
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    ParsedProps props = getProps();

    return Text(
      props.text,
      style: TextStyle(
        color: props.color,
        fontSize: props.size,
        fontWeight: props.fontWeight,
      ),
    );
  }
}
