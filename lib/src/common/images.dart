

import 'package:flutter/widgets.dart';
import 'package:visualizeit_extensions/logging.dart';

final _logger = Logger("extension.slides");

enum Background {
  bricks ("bricks.jpg"),
  // ignore: constant_identifier_names
  broken_egg ("broken-egg.jpg"),
  earth ("earth.jpg"),
  flower ("flower.jpg"),
  forms ("forms.jpg"),
  leaf ("leaf.jpg"),
  lion ("lion.jpg"),
  marguerite ("marguerite.jpg"),
  nature ("nature.jpg"),
  // ignore: constant_identifier_names
  orion_nebula ("orion-nebula.jpg"),
  presentation ("presentation.jpg"),
  space ("space.jpg"),
  sunflowers ("sunflowers.jpg"),
  swan ("swan.jpg"),
  texture ("texture.jpg"),
  triangles ("triangles.png"),
  wall ("wall.jpg"),
  whiteboard ("whiteboard.png"),
  wood ("wood.jpg");

  final String filename;
  const Background(this.filename);
}

enum Misc {
  meeting("meeting.jpg"),
  // ignore: constant_identifier_names
  meeting_room("meeting-room.jpg"),
  ok("ok.jpg"),
  owl("owl.jpg"),
  // ignore: constant_identifier_names
  writing_desk("writing-desk.jpg");

  final String filename;
  const Misc(this.filename);
}

ImageProvider resolveImageProviderFor(String location) {

  if (location.startsWith("background:")) {
    try {
      final background = Background.values.byName(location.substring(11));
      return AssetImage("assets/backgrounds/${background.filename}", package: "visualizeit_slides_extension");
    } catch (e) {
      _logger.error(() => "Cannot resolve image for location '$location': $e");
    }
  }

  if (location.startsWith("misc:")) {
    try {
      final misc = Misc.values.byName(location.substring(5));
      return AssetImage("assets/misc/${misc.filename}", package: "visualizeit_slides_extension");
    } catch (e) {
      _logger.error(() => "Cannot resolve image for location '$location': $e");
    }
  }

  String imgNetworkUrl = location.startsWith("gdrive:")
      ? "https://lh3.googleusercontent.com/d/${location.substring(7)}=w1000"
      : location;

  return NetworkImage(imgNetworkUrl);
}