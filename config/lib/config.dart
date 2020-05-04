library doppio_utils_config;

import 'dart:io';
import 'package:yaml/yaml.dart';

class ConfigDistr {
  String getConfig({String path, String branch, String propertyName}) {
    path ??= '.distribute/config.yml';
    final file = File(path);
    if (!file.existsSync()) throw Exception('File not found');
    if (branch == null) throw Exception('branch parmas == null');
    final yaml = loadYaml(file.readAsStringSync());
    var result = ConfigDistribution();
    for (var item in yaml) {
      if (item['branch'] != branch) {
        continue;
      }
      result.destinations = item['destinations']?.split(',')?.toString();
      result.mandatoryUpdate = item['mandatory_update']?.toString();
      result.notifyTesters = item['notify_testers']?.toString();
      result.releaseType = item['type']?.toString();
      result.prerelease = item['prerelease']?.toString();
      result.draft = item['draft']?.toString();
      break;
    }

    switch (propertyName) {
      case 'build':
        return result.build ?? '';
      case 'destinations':
        return result.destinations ?? '';
      case 'mandatory_update':
        return result.mandatoryUpdate ?? '';
      case 'notify_testers':
        return result.notifyTesters ?? '';
      case 'release_type':
        return result.releaseType ?? '';
      case 'prerelease':
        return result.prerelease ?? '';
      case 'draft':
        return result.draft ?? '';
      default:
        return '-1';
    }
  }
}

class ConfigDistribution {
  String branch;
  String destinations;
  String build;
  String mandatoryUpdate;
  String notifyTesters;
  String releaseType;
  String prerelease;
  String draft;
}
