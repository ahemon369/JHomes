import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Teal pill button from the design ("Sign Up", "Search",
/// "Explore All Listing").
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.height = 50,
    this.horizontalPadding = 24,
    this.width,
  });

  final String label;
  final VoidCallback? onTap;
  final double height;
  final double horizontalPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            widthFactor: width == null ? 1 : null,
            child: Text(
              label,
              style: AppTextStyles.button.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
