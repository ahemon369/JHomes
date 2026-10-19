import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/primary_button.dart';
import '../widgets/property_card.dart';

/// "Featured Open Rentals" section (#2845:108) — heading, 3x2 card grid
/// and a call-to-action button.
class FeaturedListingsSection extends StatelessWidget {
  const FeaturedListingsSection({super.key});

  static const double sectionHeight = 1338;

  static const _propertyImages = [
    'assets/images/property_1.png',
    'assets/images/property_2.png',
    'assets/images/property_3.png',
    'assets/images/property_4.png',
    'assets/images/property_5.png',
    'assets/images/property_6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: sectionHeight,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Featured Open Rentals',
            style: AppTextStyles.h2.copyWith(color: AppColors.ink),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 72),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              for (final image in _propertyImages) PropertyCard(image: image),
            ],
          ),
          const SizedBox(height: 72),
          Center(
            child: PrimaryButton(
              label: 'Explore All Listing',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
