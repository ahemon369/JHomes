import 'package:flutter/material.dart';

import '../widgets/design_stage.dart';
import 'sections/featured_listings_section.dart';
import 'sections/hero_section.dart';
import 'sections/how_it_works_section.dart';
import 'sections/share_invitation_section.dart';
import 'sections/site_footer.dart';
import 'sections/social_proof_section.dart';
import 'sections/why_choose_us_section.dart';

/// The "Home" frame (#2845:41) from the Figma design, authored at
/// 1440 x 5849.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double designWidth = 1440;
  static const double designHeight = 5849;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DesignStage(
        designWidth: designWidth,
        designHeight: designHeight,
        child: const Column(
          children: [
            HeroSection(),
            SocialProofSection(),
            HowItWorksSection(),
            FeaturedListingsSection(),
            WhyChooseUsSection(),
            ShareInvitationSection(),
            SiteFooter(),
          ],
        ),
      ),
    );
  }
}
