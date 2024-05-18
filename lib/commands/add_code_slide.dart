import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_slides_extension/slides_model.dart';
import 'package:visualizeit_slides_extension/src/slides/animated_code.dart';

import '../visualizeit_slides_extension.dart';

final _highlightedLinesRegExp = RegExp(r'\s*###([0-9,]*)###');

class AddCodeSlide extends ModelCommand {
  static final commandDefinition = CommandDefinition(
    SlidesExtension.extensionId,
    "add-code-slide", [
      CommandArgDef("formatted-code", ArgType.stringArray),
      CommandArgDef("language", ArgType.string, required: false, defaultValue: "dart"),
      CommandArgDef("title", ArgType.optionalString, required: false),
      CommandArgDef("subtitle", ArgType.optionalString, required: false),
    ],
  );
  final String? title;
  final String? subtitle;
  final List<String> formattedCode;
  final String language;

  AddCodeSlide.build(RawCommand rawCommand):
    title = commandDefinition.getArg(name: "title", from: rawCommand),
    subtitle = commandDefinition.getArg(name: "subtitle", from: rawCommand),
    formattedCode = commandDefinition.getArg(name: "formatted-code", from: rawCommand),
    language = commandDefinition.getArg(name: "language", from: rawCommand),
    super(SlidesExtension.globalModelName);

  @override
  Result call(Model model, CommandContext context) {
    final slidesModel = (model.clone()) as SlidesModel;

    slidesModel.addSlide(AnimatedCodeSlide(
      title: title,
      subtitle: subtitle,
      formattedCode: formattedCode.map((it) => _formattedCode(it)).toList(),
      language: language,
    ));

    return Result(model: slidesModel);
  }

  FormattedCode _formattedCode(String code) {
    final match = _highlightedLinesRegExp.matchAsPrefix(code);

    if(match != null){
      final highlightedLines = match.group(1)?.split(',').map((e) => int.tryParse(e.trim())).nonNulls.toList() ?? [];
      return FormattedCode(code: code.replaceFirst(_highlightedLinesRegExp, ''), highlightedLines: highlightedLines);
    }

    return FormattedCode(code: code);
  }
}
