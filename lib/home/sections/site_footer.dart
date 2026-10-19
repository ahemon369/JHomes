import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// Site footer (#2845:243) — newsletter, link columns, store badges,
/// legal line and the floating live-chat button.
class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  static const double sectionHeight = 584;

  static const _jhomesLinks = [
    'Home', 'About', 'Property', 'Blog', 'FAQs', 'Career', 'Contact Us',
  ];

  static const _servicesLinks = [
    'Monthly Payment Solution',
    'Free Rental Listing',
    'Rental Contract Generation',
    'Real-time Notification',
    'Community',
  ];

  static const _socials = [
    ('assets/icons/social_facebook.svg', 'Facebook'),
    ('assets/icons/social_instagram.svg', 'Instagram'),
    ('assets/icons/social_x.svg', 'Twitter'),
    ('assets/icons/social_linkedin.svg', 'LinkedIn'),
    ('assets/icons/social_whatsapp.svg', 'Whatsapp'),
    ('assets/icons/social_youtube.svg', 'YouTube'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: sectionHeight,
      color: AppColors.teal,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 72, right: 72, bottom: 40),
            child: Center(
              child: SizedBox(
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _TextAndLinks(),
                    const SizedBox(height: 40),
                    Container(height: 1, color: Colors.white.withValues(alpha: 0.10)),
                    const SizedBox(height: 40),
                    Text(
                      '\u00A9 2025 Jaburatta Digital Solutions Limited | '
                      'All Rights Reserved | Privacy Policy | Terms and '
                      'Conditions | Scam Awareness Alert | Cookie Policy',
                      style: AppTextStyles.p2.copyWith(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(left: 1344, top: 442, child: _ChatButton()),
        ],
      ),
    );
  }
}

class _TextAndLinks extends StatelessWidget {
  const _TextAndLinks();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 338,
      child: Row(
        children: const [
          _NewsletterColumn(),
          SizedBox(width: 200),
          _LinksColumn(),
        ],
      ),
    );
  }
}

class _NewsletterColumn extends StatelessWidget {
  const _NewsletterColumn();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.warmWhite.withValues(alpha: 0.20),
                  ),
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(height: 16),
              Text(
                'Stay Updated with the Latest',
                style: AppTextStyles.h3.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                'Subscribe to our newsletter for tips, updates, & expert\n'
                'insights on simplifying the credentialing process.',
                style: AppTextStyles.p2.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _NewsletterInput(),
          const SizedBox(height: 40),
          Row(
            children: [
              SvgPicture.asset('assets/icons/badge_googleplay.svg', width: 161, height: 48),
              const SizedBox(width: 16),
              SvgPicture.asset('assets/icons/badge_appstore.svg', width: 166, height: 48),
            ],
          ),
        ],
      ),
    );
  }
}

class _NewsletterInput extends StatelessWidget {
  const _NewsletterInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.inputBorder),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/icon_email.svg', width: 24, height: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Your email',
              style: AppTextStyles.p2.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              'Subscribe',
              style: AppTextStyles.buttonOnest.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinksColumn extends StatelessWidget {
  const _LinksColumn();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _LinkList(title: 'JHomes', links: SiteFooter._jhomesLinks, width: 118),
          _LinkList(title: 'Services', links: SiteFooter._servicesLinks, width: 200),
          _SocialList(),
        ],
      ),
    );
  }
}

class _LinkList extends StatelessWidget {
  const _LinkList({required this.title, required this.links, required this.width});

  final String title;
  final List<String> links;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h6.copyWith(color: Colors.white)),
          const SizedBox(height: 24),
          for (var i = 0; i < links.length; i++) ...[
            if (i > 0) const SizedBox(height: 16),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                links[i],
                style: AppTextStyles.p2.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SocialList extends StatelessWidget {
  const _SocialList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Socials', style: AppTextStyles.h6.copyWith(color: Colors.white)),
          const SizedBox(height: 24),
          for (final social in SiteFooter._socials)
            SizedBox(
              height: 42,
              child: Row(
                children: [
                  SvgPicture.asset(social.$1, width: 24, height: 24),
                  const SizedBox(width: 12),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      social.$2,
                      style: AppTextStyles.p2.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ChatButton extends StatelessWidget {
  const _ChatButton();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 72,
        height: 72,
        decoration: const BoxDecoration(
          color: AppColors.ink,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/icon_livechat.svg',
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
