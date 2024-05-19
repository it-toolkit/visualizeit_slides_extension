import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/extension_helpers.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
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
  final String alignment;

  AddFullScreenImageSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    alignment = commandDefinition.getArg(name: "alignment", from: rawCommand),
    imageUrl = commandDefinition.getArg(name: "imageUrl", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = (model.clone()) as SlidesModel;

    String imgNetworkUrl = imageUrl.startsWith("gdrive:")
        ? "https://lh3.googleusercontent.com/d/${imageUrl.substring(7)}=w1000"
        : imageUrl;

    slidesModel.addSlide(FullScreenImageSlide(
      title: title,
      subtitle: subtitle,
      alignment: parseAlignment(alignment),
      image: NetworkImage(imgNetworkUrl)
    ));

    return Result(model: slidesModel);
  }
}
