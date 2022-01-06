
import 'package:demoproject/utils/styles.dart';
import 'package:flutter/material.dart';





class TextStyles {


  static TextStyle get titleColor => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.textTagFont,

  );
  static TextStyle get headingBoldStyle => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.semiMediumFont,
    fontWeight: FontWeight.bold

  );
  static TextStyle get smallBoldColor => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.smallFont,
    fontWeight: FontWeight.bold

  );

  static TextStyle get titleBoldColor => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.textTagFont,
    fontWeight: FontWeight.bold

  );
  static TextStyle get unSelectedTabStyles => const TextStyle(
    color: Styles.subTitleColor,
    fontSize: Styles.textTagFont,

  );
  static TextStyle get subTitleTextStyle => const TextStyle(
      color: Styles.subTitleColor,
      fontSize: Styles.textTagFont,
     // fontWeight: FontWeight.bold
  );
  static TextStyle get smallText => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.extremeSmall,
  );
  static TextStyle get smallBoldText => const TextStyle(
    color: Styles.titleColor,
    fontSize: Styles.extremeSmall,
      fontWeight: FontWeight.bold
  );
  static TextStyle get smallSubTextText => const TextStyle(
    color: Styles.subTitleColor,
    fontSize: Styles.extremeSmall,
  );


}