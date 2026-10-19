import 'package:flutter/material.dart';

/// Color tokens extracted from the Figma design.
abstract final class AppColors {
  /// Primary/Primary — brand teal used for buttons, footer, accents.
  static const teal = Color(0xFF045E69);

  /// Accent teal used in the search card chart glow gradient.
  static const tealGlow = Color(0xFF08B9CF);

  /// Text/02 — near-black headings.
  static const ink = Color(0xFF151515);

  /// Text/04 — muted body copy.
  static const slate = Color(0xFF515050);

  /// Stroke/02 — hairline card borders.
  static const hairline = Color(0xFFECECEC);

  /// BG/BG 01 — page background.
  static const surface = Color(0xFFFFFFFF);

  /// BG/BG 02 — soft section background.
  static const surfaceSoft = Color(0xFFFAFAFA);

  /// Warm white used for translucent glass borders (Fill #FCFCF4).
  static const warmWhite = Color(0xFFFCFCF4);

  /// Bottom border of the footer newsletter input.
  static const inputBorder = Color(0xFFD0D5DD);

  // --- Search card chart tokens (Figma "New / Slider" design system) ---
  static const sliderTrack = Color(0xFFE3E8EE);
  static const sliderRange = Color(0xFF5469D4);
  static const sliderTick = Color(0xFFA3ACB9);
  static const sliderLabel = Color(0xFF697386);
  static const tooltipBackground = Color(0xFF3C4257);

  /// Outline for the budget min/max inputs on the glass search card.
  static const inputOutline = teal;
}
