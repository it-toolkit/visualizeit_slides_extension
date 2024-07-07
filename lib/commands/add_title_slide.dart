import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';

import '../src/slides/title.dart';
import '../visualizeit_slides_extension.dart';

class AddTitleSlide extends ModelCommand {
  static final commandDefinition = CommandDefinition(
    SlidesExtension.extensionId,
    "add-title-slide",
    [
      CommandArgDef("title", ArgType.string),
      CommandArgDef("subtitle", ArgType.optionalString, required: false)
    ],
  );
  final String title;
  final String? subtitle;

  AddTitleSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = model as SlidesModel;
    slidesModel.addSlide(TitleSlide(
      title: title,
      subtitle: subtitle
    ));

    return Result(model: slidesModel);
  }
}
