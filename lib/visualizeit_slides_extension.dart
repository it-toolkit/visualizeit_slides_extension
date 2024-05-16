library visualizeit_slides_extension;

import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/logging.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_extensions/visualizer.dart';
import 'package:visualizeit_extensions/extension.dart';
import 'package:visualizeit_slides_extension/commands/add_title_slide.dart';
import 'package:visualizeit_slides_extension/commands/create_slideshow.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/slides_widget.dart';

import 'commands/show_slides.dart';
import 'src/deck/deck.dart';

final _logger = Logger("extension.slides");

const _extensionId = "slides-extension";

class SlidesExtensionBuilder implements ExtensionBuilder {
  static const _docsLocationPath = "packages/visualizeit_slides_extension/assets/docs";
  static const _availableDocsLanguages = [LanguageCodes.en];

  @override
  Future<Extension> build() async{
    _logger.trace(() => "Building slides extension");
    await SlickSlides.initialize();
    var extension = SlidesExtension();

    final markdownDocs = {
      for (final languageCode in _availableDocsLanguages) languageCode : '$_docsLocationPath/$languageCode.md'
    };

    return Extension(_extensionId, extension, extension, markdownDocs);
  }
}

class SlidesExtension extends DefaultScriptingExtension implements ScriptingExtension, VisualizerExtension {
  static const extensionId = "slides-extension";
  static const globalModelName = "$extensionId.model";

  SlidesExtension(): super({
    CreateSlideshow.commandDefinition: CreateSlideshow.build,
    AddTitleSlide.commandDefinition: AddTitleSlide.build,
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