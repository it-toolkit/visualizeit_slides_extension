import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_slides_extension/src/deck/deck.dart';
import 'package:visualizeit_slides_extension/visualizeit_slides_extension.dart';

class SlidesModel extends Model with CommandExecutionAware {
  int currentSlideIndex = 0;
  List<Slide> slides = [];

  SlidesModel() : super(SlidesExtension.extensionId, SlidesExtension.globalModelName);

  void advance() {
    currentSlideIndex++;
  }

  bool get finished => currentSlideIndex >= maxSlideIndex;

  int get maxSlideIndex => slides.fold(0, (previousValue, slide) => previousValue + slide.subSlideCount);


  @override
  Model clone() {
    return SlidesModel()
      ..currentSlideIndex = currentSlideIndex
      ..slides = slides
      ..withCommandExecutionStateFrom(this);
  }

  void addSlide(Slide slide) {
    slides.add(slide);
  }
}
