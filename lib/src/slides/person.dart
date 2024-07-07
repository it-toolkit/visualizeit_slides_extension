import 'package:flutter/material.dart';


import '../deck/deck.dart';
import '../layouts/person.dart';

/// A slide that displays information about a person. It can have a name, title,
/// and an image.
class PersonSlide extends Slide {
  /// Creates a slide that displays information about a person. It can have a
  /// name, title, and an image.
  PersonSlide({
    required String title,
    required String name,
    required ImageProvider image,
    super.notes,
    WidgetBuilder? backgroundBuilder,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return PersonLayout(
              title: Text(title),
              name: Text(name),
              background: backgroundBuilder?.call(context),
              image: Image(
                image: image,
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

  /// Creates a slide that displays information about a person. It can have a
  /// name, title, and an image. This constructor uses [TextSpan]s instead of
  /// [String]s for the title and name to allow for rich text.
  PersonSlide.rich({
    required TextSpan title,
    required TextSpan name,
    required ImageProvider image,
    super.notes,
    WidgetBuilder? backgroundBuilder,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return PersonLayout(
              title: Text.rich(title),
              name: Text.rich(name),
              background: backgroundBuilder?.call(context),
              image: Image(
                image: image,
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
