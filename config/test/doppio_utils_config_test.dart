import 'package:flutter_test/flutter_test.dart';

import 'package:doppio_utils_config/index.dart';

void main() {
  test('getVersion', () {
    expect(VersionPub().getVersion(path: 'test_version.yaml'), '0.0.1');
  });

  test('getVersion', () {
    expect(ConfigDistr().getConfig(path: 'config.yml', branch: 'test'), '-1');
    expect(ConfigDistr().getConfig(path: 'config.yml', branch: 'master'), '-1');
    expect(ConfigDistr().getConfig(path: 'config.yml', branch: 'master', propertyName: 'destinations'), '[beta_group]');
    expect(ConfigDistr().getConfig(path: 'config.yml', branch: 'master', propertyName: 'notify_testers'), 'true');
    expect(ConfigDistr().getConfig(path: 'config.yml', branch: 'master', propertyName: 'prerelease'), 'true');
  });
}
