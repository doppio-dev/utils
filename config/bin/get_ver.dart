import 'package:doppio_utils_config/index.dart';

import 'shared.dart';

void main(List<String> arguments) {
  final map = Helper().getParams(arguments);
  var pubspecPath = defaultPubspecPath;
  if (map.containsKey('path')) pubspecPath = map['path'] ?? defaultPubspecPath;
  final ver = VersionPub().getVersion(path: pubspecPath);
  print(ver);
}
