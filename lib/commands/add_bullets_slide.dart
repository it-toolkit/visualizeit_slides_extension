import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/src/common/images.dart';
import 'package:visualizeit_slides_extension/src/slides/bullets.dart';

import '../visualizeit_slides_extension.dart';

class AddBulletsSlide extends ModelCommand {
  static final commandDefinition = CommandDefinition(
    SlidesExtension.extensionId,
    "add-bullets-slide", [
      CommandArgDef("bullets", ArgType.stringArray),
      CommandArgDef("bulletByBullet", ArgType.boolean, required: false, defaultValue: "true"),
      CommandArgDef("imageUrl", ArgType.optionalString, required: false),
      CommandArgDef("title", ArgType.optionalString, required: false),
      CommandArgDef("subtitle", ArgType.optionalString, required: false),
    ],
  );
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final List<String> bullets;
  final bool bulletByBullet;

  AddBulletsSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    imageUrl = commandDefinition.getArg(name: "imageUrl", from: rawCommand),
    bullets = commandDefinition.getArg(name: "bullets", from: rawCommand),
    bulletByBullet = commandDefinition.getArg(name: "bulletByBullet", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = model as SlidesModel;

    slidesModel.addSlide(BulletsSlide(
      title: title,
      subtitle: subtitle,
      bullets: bullets,
      bulletByBullet: bulletByBullet,
      image: imageUrl != null ? resolveImageProviderFor(imageUrl!) : null
    ));

    return Result(model: slidesModel);
  }
}
