import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

/// "Share Invitation" section (#2845:209) — heading and share card with
/// invite message and channel tiles.
class ShareInvitationSection extends StatelessWidget {
  const ShareInvitationSection({super.key});

  static const double sectionHeight = 752;

  static const _channels = [
    ('assets/icons/share_whatsapp.svg', 'WhatsApp'),
    ('assets/icons/share_message.svg', 'Text Message'),
    ('assets/icons/share_email.svg', 'Email'),
    ('assets/icons/share_facebook.svg', 'Facebook'),
    ('assets/icons/share_instagram.svg', 'Instagram'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440,
      height: sectionHeight,
      color: AppColors.surfaceSoft,
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Invite Others & Share Your Seamless\n'
            'Monthly Rent Payment Experience',
            style: AppTextStyles.h2.copyWith(color: AppColors.ink),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          const _ContactCard(),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 820,
            child: Text.rich(
              TextSpan(
                style: AppTextStyles.p1.copyWith(
                  color: AppColors.ink.withValues(alpha: 0.9),
                ),
                children: [
                  const TextSpan(
                    text: 'Hello there!\n',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: 'I\'m on JHomes now! Let\'s connect and continue our '
                        'rental payments seamlessly on the JHomes platform. '
                        'It\'s simple, reliable, secure, and convenient for '
                        'both tenants,\nlandlords, and their representatives.\n'
                        'Looking forward to making this process even easier '
                        'and more efficient for you!',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 42),
          Row(
            children: [
              for (var i = 0;
                  i < ShareInvitationSection._channels.length;
                  i++) ...[
                if (i > 0) const SizedBox(width: 24),
                Expanded(
                  child: _ChannelTile(
                    icon: ShareInvitationSection._channels[i].$1,
                    label: ShareInvitationSection._channels[i].$2,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _ChannelTile extends StatelessWidget {
  const _ChannelTile({required this.icon, required this.label});

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: AppColors.teal.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.hairline),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 32, height: 32),
            const SizedBox(height: 6),
            Text(
              label,
              style: AppTextStyles.p2.copyWith(color: AppColors.teal),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
