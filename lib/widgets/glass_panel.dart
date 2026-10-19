import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Frosted-glass panel used across the hero and "How It Works" sections.
///
/// Mirrors the Figma "background blur" effect panels: translucent white
/// fill + warm hairline border + backdrop blur.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.blurSigma = 6,
    this.fillOpacity = 0.10,
    this.borderOpacity = 0.20,
    this.padding,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final double blurSigma;
  final double fillOpacity;
  final double borderOpacity;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    return ClipRRect(
      borderRadius: radius,
      clipBehavior: clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: fillOpacity),
            borderRadius: radius,
            border: Border.all(
              color: AppColors.warmWhite.withValues(alpha: borderOpacity),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
