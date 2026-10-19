import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Single property card (#2845:111 and siblings).
class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.image});

  final String image;

  static const double cardWidth = 384;
  static const double cardHeight = 432;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.only(top: 16, right: 16, bottom: 22, left: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 352,
              height: 246,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset('assets/icons/icon_mappin.svg',
                  width: 24, height: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'New York, United States',
                  style: AppTextStyles.h6.copyWith(color: AppColors.ink),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'A fully furnished studio with modern decor, a compact kitchen, '
            'and large windows.',
            style: AppTextStyles.p2.copyWith(
              color: AppColors.slate.withValues(alpha: 0.8),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'March 2025',
                style: AppTextStyles.p2SemiboldTight.copyWith(
                  color: AppColors.ink.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(width: 24),
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.teal,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                '\u20A6 1,200/ month',
                style: AppTextStyles.p2SemiboldTight.copyWith(
                  color: AppColors.ink.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
