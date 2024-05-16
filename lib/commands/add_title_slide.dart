import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting.dart';

import '../visualizeit_slides_extension.dart';

class AddTitleSlide extends ModelCommand {
  static final commandDefinition = CommandDefinition(
    SlidesExtension.extensionId,
    "add-title-slide",
    [CommandArgDef("title", ArgType.string), CommandArgDef("subtitle", ArgType.string)],
  );
  final String title;
  final String subtitle;

  AddTitleSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
