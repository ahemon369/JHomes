import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// "Why Choose Us" section (#2845:179) — heading, photo collage and
/// the JHomes story with emphasised runs.
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  static const double sectionHeight = 980;

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
            'Seamless Rental and\nEase of Payment',
            style: AppTextStyles.h2.copyWith(color: AppColors.ink),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 72),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Collage(),
              Spacer(),
              _OurStory(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Collage extends StatelessWidget {
  const _Collage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 560,
      height: 596,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: _Photo(
              image: 'assets/images/why_choose_1.png',
              width: 330,
              height: 460,
            ),
          ),
          Positioned(
            left: 156,
            top: 296,
            child: _Photo(
              image: 'assets/images/why_choose_2.png',
              width: 404,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({required this.image, required this.width, required this.height});

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

class _OurStory extends StatelessWidget {
  const _OurStory();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 560,
      height: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JHomes \u2013 The Future of Renting Starts Here.',
            style: AppTextStyles.h5.copyWith(color: AppColors.ink),
          ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              style: AppTextStyles.p1.copyWith(
                color: AppColors.ink.withValues(alpha: 0.9),
              ),
              children: _storySpans(),
            ),
          ),
        ],
      ),
    );
  }
}

List<InlineSpan> _storySpans() {
  const normalWeight = FontWeight.w400;
  const boldWeight = FontWeight.w600;

  InlineSpan run(String text, {bool bold = false}) => TextSpan(
        text: text,
        style: TextStyle(fontWeight: bold ? boldWeight : normalWeight),
      );

  return [
    run('At JHomes', bold: true),
    run(
      ', we\'re reshaping the rental experience by combining powerful '
      'technology with a deep understanding of what people really need. '
      'Our platform offers a ',
    ),
    run('flexible, pay-as-you-go rental model', bold: true),
    run(
      ' that eliminates long-term lock-ins, hidden fees, & unnecessary '
      'commissions \u2014 putting control back into the hands of tenants '
      'and landlords.\n',
    ),
    run('intelligent automation, secure digital transactions,', bold: true),
    run(' and a '),
    run('user-friendly interface,', bold: true),
    run(
      ' JHomes simplifies every step of the rental journey. From seamless '
      'onboarding to transparent payments and real-time support, we make '
      'renting effortless, fair, and future-ready.\nWhether you\'re looking '
      'for a new home or managing one, JHomes delivers a ',
    ),
    run('smart, scalable, and people-first solution ', bold: true),
    run('built for today\u2019s world.\n'),
    run('Tech-powered. People-driven. Renting, redefined.', bold: true),
  ];
}
