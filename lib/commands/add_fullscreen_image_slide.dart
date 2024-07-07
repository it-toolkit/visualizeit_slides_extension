import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting_extensions.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/src/common/images.dart';
import 'package:visualizeit_slides_extension/src/slides/full_screen_image.dart';

import '../visualizeit_slides_extension.dart';

class AddFullScreenImageSlide extends ModelCommand {
  static final commandDefinition = CommandDefinition(
    SlidesExtension.extensionId,
    "add-fullscreen-image-slide", [
      CommandArgDef("imageUrl", ArgType.string),
      CommandArgDef("alignment", ArgType.string, required: false, defaultValue: "center"),
      CommandArgDef("title", ArgType.optionalString, required: false),
      CommandArgDef("subtitle", ArgType.optionalString, required: false),
    ],
  );
  final String? title;
  final String? subtitle;
  final String imageUrl;
  final Alignment alignment;

  AddFullScreenImageSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    alignment = commandDefinition.getAlignmentArg(name: "alignment", from: rawCommand),
    imageUrl = commandDefinition.getArg(name: "imageUrl", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = model as SlidesModel;

    slidesModel.addSlide(FullScreenImageSlide(
      title: title,
      subtitle: subtitle,
      alignment: alignment,
      image: resolveImageProviderFor(imageUrl)
    ));

    return Result(model: slidesModel);
  }
}
