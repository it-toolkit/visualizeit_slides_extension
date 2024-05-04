library visualizeit_extension_template;

import 'package:flutter/material.dart';
import 'package:visualizeit_extensions/common.dart';
import 'package:visualizeit_extensions/logging.dart';
import 'package:visualizeit_extensions/scripting.dart';
import 'package:visualizeit_extensions/visualizer.dart';
import 'package:visualizeit_extensions/extension.dart';
import 'package:flutter/services.dart' show rootBundle;

final _logger = Logger("extension.fake");

const _extensionId = "fake-extension";

class FakeExtensionBuilder implements ExtensionBuilder {
  @override
  Future<Extension> build() async{
    _logger.trace(() => "Building fake extension");
    var fakeExtension = FakeExtension();

    const assetLocationPrefix = "packages/visualizeit_extension_template/";
    final markdownDocs = {
      LanguageCodes.en : await rootBundle.loadString('${assetLocationPrefix}assets/docs/en.md')
    };

    return Extension(_extensionId, fakeExtension, fakeExtension, markdownDocs);
  }
}

class FakeExtension implements ScriptingExtension, VisualizerExtension {
  @override
  Command? buildCommand(String rawCommand) {
    if(rawCommand != "fake-command") return null;

    _logger.trace(() => "Building fake command");
    return FakeCommand.build();
  }

  @override
  List<CommandDefinition> getAllCommandDefinitions() {
    _logger.trace(() => "Getting fake extension command definitions");
    return [
      CommandDefinition(_extensionId, "fake-command", [])
    ];
  }

  @override
  Widget? render(Model model, BuildContext context) {
    _logger.trace(() => "Rendering fake extension model: $model");
    return Positioned.fill(
      child: Align(
      child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(15), // Rounded borders
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Position of shadow
          ),
        ],
      ),
      child: Text(
        (model as FakeModel).text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    )));
  }
}

class FakeCommand extends ModelBuilderCommand {

  FakeCommand.build();

  @override
  Model call() {
    _logger.trace(() => "Calling Fake command");
    return FakeModel();
  }
}

class FakeModel extends Model {
  final text = "Fake model text";

  FakeModel(): super(_extensionId, "fake_model");

  @override
  Model clone() {
    return this; //return the same as this example is immutable
  }
}