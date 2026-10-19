import 'package:flutter/material.dart';

import '../../theme/app_text_styles.dart';
import '../../widgets/glass_panel.dart';
import '../../widgets/primary_button.dart';
import '../widgets/search_card.dart';

/// Hero section (#2845:42) — full-bleed photo, glass navigation bar,
/// headline and the glass search card.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const double sectionHeight = 1075;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1440,
      height: sectionHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/hero_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                // Figma gradient handles extend past the frame:
                // from y = -12% (rgba(0,0,0,.08)) to y = 112% (black).
                gradient: LinearGradient(
                  begin: Alignment(0, -1.24),
                  end: Alignment(0, 1.242),
                  colors: [Color(0x14000000), Color(0xFF000000)],
                ),
              ),
            ),
          ),
          const Positioned(left: 120, top: 32, child: _NavigationBar()),
          const Positioned(left: 224, top: 301, child: _Headline()),
          const Positioned(left: 214, top: 607, child: SearchCard()),
        ],
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      width: 1200,
      height: 50,
      borderRadius: 16,
      blurSigma: 6,
      fillOpacity: 0,
      borderOpacity: 0,
      child: Row(
        children: const [
          _LogoBadge(),
          SizedBox(width: 160),
          _NavLinks(),
          Spacer(),
          _NavActions(),
        ],
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge();

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      width: 50,
      height: 50,
      borderRadius: 8,
      blurSigma: 6,
      fillOpacity: 0.10,
      borderOpacity: 0.20,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}

class _NavLinks extends StatelessWidget {
  const _NavLinks();

  static const _links = ['About', 'Property', 'FAQ', 'Blog', 'Pricing', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final inactive = AppTextStyles.p2.copyWith(
      color: Colors.white.withValues(alpha: 0.9),
    );
    return Row(
      children: [
        Text('Home', style: AppTextStyles.buttonOnest.copyWith(color: Colors.white)),
        for (final link in _links) ...[
          const SizedBox(width: 32),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(link, style: inactive),
          ),
        ],
      ],
    );
  }
}

class _NavActions extends StatelessWidget {
  const _NavActions();

  @override
  Widget build(BuildContext context) {
    final action = AppTextStyles.button.copyWith(color: Colors.white);
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text('Contract Signing', style: action),
        ),
        const SizedBox(width: 24),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text('Log In', style: action),
        ),
        const SizedBox(width: 24),
        const PrimaryButton(label: 'Sign Up'),
      ],
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 592,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Property\nRental Solutions',
            style: AppTextStyles.h1.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'Revolutionizing and disrupting the real estate experience in '
            'Nigeria by providing a seamless,\ntechnology-driven platform '
            'that bridges the gap between landlords, vendors and tenants.',
            style: AppTextStyles.p1.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
