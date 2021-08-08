import 'package:flutter/foundation.dart';

class OnboardPageItem {
  String? image;
  Duration? animationDuration;
  String? text;
  String? text1;
  String? icon;

  OnboardPageItem(
      {@required this.image,
      @required this.text,
      @required this.text1,
      @required this.icon,
      this.animationDuration});
}
