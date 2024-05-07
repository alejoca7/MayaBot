import 'package:flutter/material.dart';
import 'package:mayatraductor/core/utils/size_utils.dart';
import 'package:mayatraductor/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumHindSiliguriBluegray800a2 =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: appTheme.blueGray800A2,
      );
  static get bodyMediumHindSiliguriff2c406e =>
      theme.textTheme.bodyMedium!.hindSiliguri.copyWith(
        color: Color(0XFF2C406E),
      );
  static get bodySmallIndigo400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo400,
      );
  static get bodySmallInterGreenA200 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.greenA200,
      );
  // Display text style
  static get displaySmallPrimary => theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Headline text style
  static get headlineLargeIndigo400 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.indigo400,
      );
  static get headlineLargeff3c096c => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF3C096C),
      );
  static get headlineLargeff7b2cbf => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF7B2CBF),
      );
  // Title text style
  static get titleMediumHindSiliguriGray50 =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumHindSiliguriOnPrimary =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumHindSiliguriPink300 =>
      theme.textTheme.titleMedium!.hindSiliguri.copyWith(
        color: appTheme.pink300,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterPurple9007f =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.purple9007f,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get hindSiliguri {
    return copyWith(
      fontFamily: 'Hind Siliguri',
    );
  }
}
