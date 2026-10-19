import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/glass_panel.dart';

/// Glass search card from the hero (#4589:8716) — location/type selectors,
/// budget min/max inputs, price-histogram chart and range slider.
class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  static const double cardWidth = 1012;
  static const double cardHeight = 287;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      width: cardWidth,
      height: cardHeight,
      borderRadius: 16,
      blurSigma: 6,
      fillOpacity: 0.10,
      child: Stack(
        children: const [
          Positioned(
            left: 131,
            top: 16,
            child: SizedBox(
              width: 811,
              height: 234,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SelectorRow(),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 156,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _BudgetBlock(),
                        Spacer(),
                        _PriceChart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Top row: location / type / search button
// ---------------------------------------------------------------------------

class _SelectorRow extends StatelessWidget {
  const _SelectorRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Row(
        children: const [
          _FieldBlock(label: 'Location', value: 'Lagos, Nigeria', width: 102),
          SizedBox(width: 264),
          _FieldBlock(label: 'Type', value: 'Rent', width: 80),
          SizedBox(width: 264),
          _SearchButton(),
        ],
      ),
    );
  }
}

class _FieldBlock extends StatelessWidget {
  const _FieldBlock({required this.label, required this.value, required this.width});

  final String label;
  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.p1.copyWith(color: Colors.white)),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.p2.copyWith(
              color: Colors.white.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 101,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Search',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Budget min/max inputs
// ---------------------------------------------------------------------------

class _BudgetBlock extends StatelessWidget {
  const _BudgetBlock();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 311,
      height: 129,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Budget', style: AppTextStyles.p1.copyWith(color: Colors.white)),
          const SizedBox(height: 15),
          const _BudgetInputRow(label: 'Min', value: '25k'),
          const SizedBox(height: 10),
          const _BudgetInputRow(label: 'Max', value: '83k'),
        ],
      ),
    );
  }
}

class _BudgetInputRow extends StatelessWidget {
  const _BudgetInputRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              label,
              style: AppTextStyles.p1.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 7),
          Container(
            width: 264,
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.inputOutline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                value,
                style: AppTextStyles.p1.copyWith(
                  color: Colors.white.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Price histogram + range slider
// ---------------------------------------------------------------------------

/// Bar heights in design order (#4837:395..#4837:425).
const List<double> _barHeights = [
  14, 21, 29, 38, 45, 50, 58, 62, 65, 68, 75, 81, 88, 93, 99, 107, 112,
  102, 93, 85, 75, 65, 56, 48, 40, 30, 25, 18, 12, 8,
];

class _PriceChart extends StatelessWidget {
  const _PriceChart();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 352,
      height: 156,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Histogram bars.
          Positioned(
            left: 1,
            top: 0,
            width: 324,
            height: 112,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final height in _barHeights)
                  Container(
                    width: 3,
                    height: height,
                    decoration: BoxDecoration(
                      color: AppColors.teal,
                      borderRadius: BorderRadius.circular(2.76),
                    ),
                  ),
              ],
            ),
          ),
          // Soft glow mound behind the histogram (Vector 1).
          Positioned(
            left: 3.5,
            top: 30,
            width: 244.5,
            height: 81.5,
            child: Opacity(
              opacity: 0.3,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, AppColors.tealGlow],
                    ),
                    borderRadius: BorderRadius.circular(986),
                  ),
                ),
              ),
            ),
          ),
          // Slider track + selected range.
          Positioned(
            left: 0,
            top: 112,
            width: 352,
            height: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.sliderTrack,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            left: 137,
            top: 112,
            width: 193,
            height: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.sliderRange,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const Positioned(left: 137, top: 102, child: _DragHandle()),
          const Positioned(left: 310, top: 102, child: _DragHandle()),
          const Positioned(left: 124, top: 80, child: _Tooltip(' \u20A6 35k')),
          const Positioned(left: 297, top: 80, child: _Tooltip(' \u20A6 83k')),
          // Tick labels.
          const Positioned(left: 0, top: 124, width: 352, height: 32, child: _TickLabels()),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFC1C9D2)),
        boxShadow: const [
          BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 1),
          BoxShadow(color: Color(0x143C4257), offset: Offset(0, 2), blurRadius: 5),
        ],
      ),
    );
  }
}

class _Tooltip extends StatelessWidget {
  const _Tooltip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.tooltipBackground,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Color(0x1A374151), offset: Offset(0, 1), blurRadius: 3),
          BoxShadow(color: Color(0x0F374151), offset: Offset(0, 1), blurRadius: 2),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.tooltip.copyWith(color: AppColors.sliderTrack),
          maxLines: 1,
        ),
      ),
    );
  }
}

class _TickLabels extends StatelessWidget {
  const _TickLabels();

  static const _labels = [
    ' \u20A6 0', '10', '20', '30', '40', '50', '60', '70', '80', '90', ' \u20A6 100k',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _labels.length; i++)
          _Tick(
            label: _labels[i],
            tall: i == 0 || i == 5 || i == _labels.length - 1,
            align: i == 0
                ? CrossAxisAlignment.start
                : i == _labels.length - 1
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.center,
          ),
      ],
    );
  }
}

class _Tick extends StatelessWidget {
  const _Tick({required this.label, required this.tall, required this.align});

  final String label;
  final bool tall;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: align,
      children: [
        Container(
          width: 1,
          height: tall ? 12 : 6,
          decoration: BoxDecoration(
            color: AppColors.sliderTick,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.tickLabel.copyWith(color: AppColors.sliderLabel),
          maxLines: 1,
        ),
      ],
    );
  }
}
