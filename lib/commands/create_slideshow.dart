import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';

import '../visualizeit_slides_extension.dart';

class CreateSlideshow extends ModelBuilderCommand {
  static final commandDefinition = CommandDefinition(SlidesExtension.extensionId, "create-slideshow", []);

  CreateSlideshow.build(RawCommand rawCommand);

  @override
  Model call(CommandContext context) {
    // TODO: implement call
    return SlidesModel();
  }
}
