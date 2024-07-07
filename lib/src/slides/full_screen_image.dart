import 'package:flutter/material.dart';

import '../deck/deck.dart';
import '../layouts/title.dart';


/// A slide that displays a title and subtitle centered on the slide.
class FullScreenImageSlide extends Slide {
  /// Creates a slide that displays a title and subtitle centered on the slide.
  FullScreenImageSlide({
    required ImageProvider image,
    String? title,
    String? subtitle,
    Alignment alignment = Alignment.center,
    super.notes,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return TitleLayout(
              title: title == null ? null : Text(title),
              subtitle: subtitle == null ? null : Text(subtitle),
              alignment: alignment,
              background: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            );
          },
          onPrecache: (context) async {
            await precacheImage(
              image,
              context,
            );
          },
        );

  /// Creates a slide that displays a title and subtitle centered on the slide.
  /// This constructor uses [TextSpan]s instead of [String]s for the title and
  /// subtitle to allow for rich text.
  FullScreenImageSlide.rich({
    required ImageProvider image,
    TextSpan? title,
    TextSpan? subtitle,
    Alignment alignment = Alignment.center,
    WidgetBuilder? backgroundBuilder,
    super.notes,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return TitleLayout(
              title: title == null ? null : Text.rich(title),
              subtitle: subtitle == null ? null : Text.rich(subtitle),
              alignment: alignment,
              background: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            );
          },
          onPrecache: (context) async {
            await precacheImage(
              image,
              context,
            );
          },
        );
}
