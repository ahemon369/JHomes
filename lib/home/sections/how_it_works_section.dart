import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/glass_panel.dart';

/// "How It Works" section (#2845:99) — heading and a photo card with three
/// frosted step cards.
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  static const double sectionHeight = 856;

  static const _steps = [
    ('01', ' \u2014Register and Verify your Identity for a Safer Experience'),
    ('02', ' \u2014Create New Rental or Onboard Your Ongoing Rental Agreement'),
    ('03', ' \u2014Start Connecting the Power of Collaboration'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: sectionHeight,
      color: AppColors.surfaceSoft,
      padding: const EdgeInsets.only(top: 40, right: 120, bottom: 100, left: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How It Works',
            style: AppTextStyles.h2.copyWith(color: AppColors.ink),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 72),
          const _PhotoCard(),
        ],
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 588,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/how_it_works_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // Figma gradient handles: transparent at y = 37.4%,
                  // black at y = 106%.
                  gradient: LinearGradient(
                    begin: Alignment(0, -0.252),
                    end: Alignment(0, 1.12),
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 32,
                top: 396,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < HowItWorksSection._steps.length; i++) ...[
                    if (i > 0) const SizedBox(width: 24),
                    Expanded(
                      child: _StepCard(
                        number: HowItWorksSection._steps[i].$1,
                        text: HowItWorksSection._steps[i].$2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final base = AppTextStyles.h5.copyWith(color: Colors.white);
    return GlassPanel(
      borderRadius: 8,
      blurSigma: 6,
      fillOpacity: 0.10,
      borderOpacity: 0.20,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text.rich(
          TextSpan(
            style: base,
            children: [
              TextSpan(
                text: number,
                style: base.copyWith(color: AppColors.teal),
              ),
              TextSpan(text: text),
            ],
          ),
        ),
      ),
    );
  }
}
