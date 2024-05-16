import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_slides_extension/src/deck/deck.dart';
import 'package:visualizeit_slides_extension/visualizeit_slides_extension.dart';

import 'src/deck/theme.dart';
import 'src/slides/animated_code.dart';
import 'src/slides/bullets.dart';
import 'src/slides/full_screen_image.dart';
import 'src/transitions/fade.dart';

class SlidesModel extends Model with CommandExecutionAware {
  int currentSlideIndex = 0;

  SlidesModel() : super(SlidesExtension.extensionId, SlidesExtension.globalModelName);

  void advance() {
    currentSlideIndex++;
  }

  bool get finished => currentSlideIndex >= maxSlideIndex;

  int get maxSlideIndex => slides.fold(0, (previousValue, slide) => previousValue + slide.subSlideCount);


  @override
  Model clone() {
    //TODO return this;
    return SlidesModel()
      ..currentSlideIndex = currentSlideIndex
      ..slides = slides
      ..withCommandExecutionStateFrom(this);
    ;
  }

  static const _defaultTransition = SlickFadeTransition(color: Colors.black);
  List<Slide> slides = [
    FullScreenImageSlide(
      image: const AssetImage('packages/visualizeit_slides_extension/assets/logo-background.jpg'),
      title: 'VisualizeIT',
      subtitle: 'Enhancing Learning through\nVisual and Interactive Tools',
      alignment: const Alignment(0.6, 0.0),
      theme: const SlideThemeData.darkAlt(),
      transition: _defaultTransition,
    ),
    BulletsSlide(
      title: 'What is VisualizeIT?',
      bulletByBullet: true,
      bullets: const [
        'VisualizeIT is an innovative app designed to help users understand algorithms and data structures through animated visualizations',
        'Core Features: '
          '\n - Animated operations of algorithms and data structures.'
          '\n - Customizable scripting language for creating unique visualizations.'
          '\n - Extension support for adding new functionalities'
      ],
      transition: _defaultTransition,
    ),
    BulletsSlide(
      title: 'Key Features and Benefits',
      bulletByBullet: true,
      bullets: [
        'Customizable Scripting Language:'
          '\n - Define and customize algorithm visualizations.'
          '\n - Simple syntax for easy learning and implementation.',
        'Extension Support:'
          '\n - Develop and integrate new features.'
          '\n - Follow clear development guidelines.',
        'Multi-platform Support:'
          '\n - Built with Flutter for compatibility across iOS, Android, and web platforms.',
        'Educational Value:'
          '\n - Ideal for students and educators.'
          '\n - Enhances understanding of complex concepts through interactive learning.'
      ],
      transition: _defaultTransition,
    ),
    BulletsSlide(
      title: 'Technical Details',
      bulletByBullet: true,
      bullets: [
        'Technology Stack:'
          '\n - Developed using Flutter, ensuring a consistent experience across all platforms.',
        'Customization and Extensibility:'
          '\n - Easily extend the app with new functionalities.'
          '\n - Comprehensive development guidelines available.',
        'User Interface:'
          '\n - Intuitive and user-friendly design.'
          '\n - Smooth animations for better visual understanding.'
      ],
      transition: _defaultTransition,
    ),
    BulletsSlide(
      title: 'Meet the Team',
      image: const NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
      bulletByBullet: true,
      bullets: [
        'Team: '
          '\n - Anibal Irrera'
          '\n - Fernando Mansilla'
          '\n - Osiris Argüello',
        'Tutor: '
          '\n - Arturo Servetto'
      ],
      transition: _defaultTransition,
    ),
    AnimatedCodeSlide(
      title: 'Simple script example',
      language: 'yaml',
      formattedCode: [
        FormattedCode(code: ''),
        FormattedCode(code: _scriptExample.take(6).join('\n'), highlightedLines: [0,1,2,3,4,5]),
        FormattedCode(code: _scriptExample.take(7).join('\n'), highlightedLines: [6]),
        FormattedCode(code: _scriptExample.take(10).join('\n'), highlightedLines: [7,8,9]),
        FormattedCode(code: _scriptExample.take(12).join('\n'), highlightedLines: [10,11]),
        FormattedCode(code: _scriptExample.join('\n'), highlightedLines: [12,13,14,15,16,17]),
      ],
    ),
    FullScreenImageSlide(
        image: const NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Thats_all_folks.svg/1589px-Thats_all_folks.svg.png?20150104034840")
    )
  ];
}

final _scriptExample = '''
name: "Global commands example"
description: |-
  ## Global commands example
    
  This simple script uses some global commands like show-banner, show-popup and background
tags: [global-extension, dev-example]
scenes:
  - name: First scene
    extensions: []
    description: Scene showing some global commands usage
    initial-state:
      - background: ["https://a-background-image-location", cover]
    transitions:
      - show-banner:
          message: 'Banner example'
          position: center
          duration: 2
'''.split('\n');
