
import 'package:flutter/material.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/src/deck/theme.dart';

import 'src/deck/deck.dart';

class SlidesWidget extends StatelessWidget {
  final SlidesModel model;

  const SlidesWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlideDeck(
      includeDeckControls: false,
      slides: model.slides,
      fineRewind: true,
      currentSlideIndex: model.currentSlideIndex,
      theme: const SlideThemeData.dark(),
    );
  }
}