import 'package:flutter/material.dart';

/// The Figma frame is authored on a fixed 1440 px design canvas.
///
/// [DesignStage] renders that canvas 1:1 when the viewport is at least
/// [designWidth] wide, and proportionally scales it down for narrower
/// viewports so the composition always matches the reference design
/// without any layout drift.
class DesignStage extends StatelessWidget {
  const DesignStage({
    super.key,
    required this.child,
    required this.designWidth,
    required this.designHeight,
  });

  final Widget child;
  final double designWidth;
  final double designHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = (constraints.maxWidth / designWidth).clamp(0.0, 1.0);
        return SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: designWidth * scale,
              height: designHeight * scale,
              // FittedBox lays the stage out at its intrinsic 1440x5849
              // size and scales the painting to fit the viewport.
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: designWidth,
                  height: designHeight,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
