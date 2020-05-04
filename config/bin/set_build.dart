
import 'package:doppio_utils_config/index.dart';

import 'shared.dart';

void main(List<String> arguments) {
  var pubspecPath = defaultPubspecPath;
  if (arguments.isEmpty) panic('you must specify build number');
  final number = int.tryParse(arguments[0]);
  if (number == null) panic('build number is not a number');
  if (arguments.length >= 2) pubspecPath = arguments[1];
  VersionPub().setBuildNumber(number, path: pubspecPath);
}
