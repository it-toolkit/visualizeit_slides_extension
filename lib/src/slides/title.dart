import 'package:flutter/material.dart';

import '../deck/deck.dart';
import '../layouts/title.dart';

/// A slide that displays a title and subtitle centered on the slide.
class TitleSlide extends Slide {
  /// Creates a slide that displays a title and subtitle centered on the slide.
  TitleSlide({
    required String title,
    String? subtitle,
    Alignment alignment = Alignment.center,
    WidgetBuilder? backgroundBuilder,
    super.notes,
    super.transition,
    super.theme,
    super.audioSource,
    super.autoplayDuration,
  }) : super(
          builder: (context) {
            return TitleLayout(
              title: Text(title),
              subtitle: subtitle == null ? null : Text(subtitle),
              alignment: alignment,
              background: backgroundBuilder?.call(context),
            );
          },
        );

  /// Creates a slide that displays a title and subtitle centered on the slide.
  /// This constructor uses [TextSpan]s instead of [String]s for the title and
  /// subtitle to allow for rich text.
  TitleSlide.rich({
    required TextSpan title,
    TextSpan? subtitle,
    Alignment alignment = Alignment.center,
    WidgetBuilder? backgroundBuilder,
    super.notes,
    super.transition,
    super.theme,
    super.audioSource,
    super.autoplayDuration,
  }) : super(
          builder: (context) {
            return TitleLayout(
              title: Text.rich(title),
              subtitle: subtitle == null ? null : Text.rich(subtitle),
              alignment: alignment,
              background: backgroundBuilder?.call(context),
            );
          },
        );
}
