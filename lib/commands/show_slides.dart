import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/logging.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';

import '../visualizeit_slides_extension.dart';

final _logger = Logger("extension.slides.show");

class ShowSlides extends ModelCommand {
  static final commandDefinition = CommandDefinition(SlidesExtension.extensionId, "show-slides", []);

  ShowSlides.build(RawCommand rawCommand): super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = model as SlidesModel;
    if(slidesModel.currentSlideIndex == 0) {
      slidesModel.withFramesDuration(slidesModel.maxSlideIndex);
    }

    if(!slidesModel.isFinished) {
      slidesModel.consumePendingFrame(context);
      slidesModel.advance();
    }

    _logger.trace(() => "Pending frames [${slidesModel.pendingFrames}], progress [${slidesModel.currentSlideIndex}/${slidesModel.maxSlideIndex}], finished [${slidesModel.isFinished}]");

    return Result(model: slidesModel, finished: slidesModel.isFinished);
  }
}
