library visualizeit_slides_extension;

import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/logging.dart';
import 'package:visualizeit_extensions/extension.dart';
import 'package:visualizeit_slides_extension/commands/add_bullets_slide.dart';
import 'package:visualizeit_slides_extension/commands/add_code_slide.dart';
import 'package:visualizeit_slides_extension/commands/add_fullscreen_image_slide.dart';
import 'package:visualizeit_slides_extension/commands/add_title_slide.dart';
import 'package:visualizeit_slides_extension/commands/create_slideshow.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/slides_widget.dart';

import 'commands/show_slides.dart';
import 'src/deck/deck.dart';

final _logger = Logger("extension.slides");

final class SlidesExtension extends Extension {
  static const extensionId = "slides";
  static const globalModelName = "${SlidesExtension.extensionId}.model";

  SlidesExtension._create({required super.markdownDocs, required super.extensionCore}): super.create(id: extensionId);
}


class SlidesExtensionBuilder implements ExtensionBuilder {
  static const _docsLocationPath = "packages/visualizeit_slides_extension/assets/docs";
  static const _availableDocsLanguages = [LanguageCodes.en];

  @override
  Future<Extension> build() async{
    _logger.trace(() => "Building slides extension");
    await SlickSlides.initialize();

    final markdownDocs = {
      for (final languageCode in _availableDocsLanguages) languageCode : '$_docsLocationPath/$languageCode.md'
    };

    return SlidesExtension._create(markdownDocs: markdownDocs, extensionCore: SlidesExtensionCore());
  }
}

class SlidesExtensionCore extends SimpleExtensionCore{
  SlidesExtensionCore(): super({
    CreateSlideshow.commandDefinition: CreateSlideshow.build,
    AddTitleSlide.commandDefinition: AddTitleSlide.build,
    AddFullScreenImageSlide.commandDefinition: AddFullScreenImageSlide.build,
    AddBulletsSlide.commandDefinition: AddBulletsSlide.build,
    AddCodeSlide.commandDefinition: AddCodeSlide.build,
    ShowSlides.commandDefinition: ShowSlides.build
  });

  // CommandDefinition(_extensionId, "add-big-fact-slide", [CommandArgDef("title", ArgType.string), CommandArgDef("subtitle", ArgType.string)]),
  // CommandDefinition(_extensionId, "add-image-slide", [CommandArgDef("title", ArgType.string), CommandArgDef("imageUrl", ArgType.string), CommandArgDef("imageLabel", ArgType.string)]),
  // CommandDefinition(_extensionId, "add-quote-slide", [CommandArgDef("title", ArgType.string), CommandArgDef("quote", ArgType.string), CommandArgDef("attribution", ArgType.string)]),
  // CommandDefinition(_extensionId, "add-markdown-split-slide", [CommandArgDef("title", ArgType.string), CommandArgDef("leftMarkdown", ArgType.string), CommandArgDef("rightMarkdown", ArgType.string)]),
  // CommandDefinition(_extensionId, "add-markdown-slide", [CommandArgDef("title", ArgType.string), CommandArgDef("markdown", ArgType.string)]),
  // CommandDefinition(_extensionId, "show-slides", [])

  @override
  Widget? render(Model model, BuildContext context) {
    _logger.trace(() => "Rendering slides extension model: $model");
    var slidesModel = model as SlidesModel;

    return SlidesWidget(slidesModel);
  }
}