import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Social proof strip (#2845:81) — five stat cards on a white band.
class SocialProofSection extends StatelessWidget {
  const SocialProofSection({super.key});

  static const double sectionHeight = 264;

  static const _stats = [
    ('Monthly', 'Rental Payment'),
    ('3.5% Commission', 'For Landlord'),
    ('0% Commission', 'For Tenant'),
    ('Free', 'Subscription'),
    ('0% Agency Fee', 'For Tenant'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: sectionHeight,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 60),
      child: Row(
        children: [
          for (var i = 0; i < _stats.length; i++) ...[
            if (i > 0) const SizedBox(width: 24),
            Expanded(
              child: _StatCard(
                title: _stats[i].$1,
                label: _stats[i].$2,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.label});

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.h5.copyWith(color: AppColors.ink),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.p1.copyWith(color: AppColors.slate),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
