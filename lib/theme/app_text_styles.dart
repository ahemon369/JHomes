import 'package:flutter/material.dart';

/// Typography scale extracted from the Figma design.
///
/// Letter spacing values are the design's -0.02em expressed in logical pixels.
abstract final class AppTextStyles {
  static const String onest = 'Onest';
  static const String robotoFlex = 'RobotoFlex';
  static const String inter = 'Inter';

  /// Desktop/Heading/H1 — 72/80 SemiBold.
  static const h1 = TextStyle(
    fontFamily: onest,
    fontSize: 72,
    height: 80 / 72,
    fontWeight: FontWeight.w600,
    letterSpacing: -1.44,
  );

  /// Desktop/Heading/H2 — 48/56 SemiBold.
  static const h2 = TextStyle(
    fontFamily: onest,
    fontSize: 48,
    height: 56 / 48,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.96,
  );

  /// 32/40 SemiBold — footer newsletter title.
  static const h3 = TextStyle(
    fontFamily: onest,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.64,
  );

  /// Desktop/Heading/H5 — 24/32 SemiBold.
  static const h5 = TextStyle(
    fontFamily: onest,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.48,
  );

  /// 20/28 SemiBold — card titles and footer column titles.
  static const h6 = TextStyle(
    fontFamily: onest,
    fontSize: 20,
    height: 28 / 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
  );

  /// Desktop/Paragraph/P1 — 18/28 Regular.
  static const p1 = TextStyle(
    fontFamily: onest,
    fontSize: 18,
    height: 28 / 18,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.36,
  );

  /// Desktop/Paragraph/P2 — 16/26 Regular.
  static const p2 = TextStyle(
    fontFamily: onest,
    fontSize: 16,
    height: 26 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.32,
  );

  /// 16/26 SemiBold — small emphasized labels.
  static const p2Semibold = TextStyle(
    fontFamily: onest,
    fontSize: 16,
    height: 26 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
  );

  /// 16/18 SemiBold — property card meta ("March 2025", "₦ 1,200/ month").
  static const p2SemiboldTight = TextStyle(
    fontFamily: onest,
    fontSize: 16,
    height: 18 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
  );

  /// Desktop/Button/Large — Roboto Flex 16/18 SemiBold.
  static const button = TextStyle(
    fontFamily: robotoFlex,
    fontSize: 16,
    height: 18 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
  );

  /// Onest 16/18 SemiBold — text buttons ("Subscribe").
  static const buttonOnest = TextStyle(
    fontFamily: onest,
    fontSize: 16,
    height: 18 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.32,
  );

  /// Small / 600 — Inter 12/16 SemiBold (slider tooltips).
  static const tooltip = TextStyle(
    fontFamily: inter,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
  );

  /// Small / 500 — Inter 12/16 Medium (slider tick labels).
  static const tickLabel = TextStyle(
    fontFamily: inter,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );
}
