import 'package:doppio_utils_config/index.dart';

void main(List<String> arguments) {
  final map = Helper().getParams(arguments);
  final result = ConfigDistr().getConfig(path: map['path'], branch: map['branch'], propertyName: map['propertyName']);
  print(result);
}
