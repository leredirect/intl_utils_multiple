import 'package:yaml/yaml.dart' as yaml;

import '../utils/file_utils.dart';
import 'config_exception.dart';
import 'localization_details.dart';

class PubspecConfig {
  List<LocalizationDetails>? _localizationDetails;
  bool? _enabled;
  String? _mainLocale;
  bool? _useDeferredLoading;

  PubspecConfig() {
    var pubspecFile = getPubspecFile();
    if (pubspecFile == null) {
      throw ConfigException("Can't find 'pubspec.yaml' file.");
    }

    var pubspecFileContent = pubspecFile.readAsStringSync();
    var pubspecYaml = yaml.loadYaml(pubspecFileContent);

    if (pubspecYaml is! yaml.YamlMap) {
      throw ConfigException(
          "Failed to extract config from the 'pubspec.yaml' file.\nExpected YAML map but got ${pubspecYaml.runtimeType}.");
    }

    var flutterIntlConfig = pubspecYaml['flutter_intl'];
    if (flutterIntlConfig == null) {
      return;
    }

    _enabled = flutterIntlConfig['enabled'] is bool
        ? flutterIntlConfig['enabled']
        : null;
    _localizationDetails = [];
    if (flutterIntlConfig['structure'] is yaml.YamlList) {
      for (var d in flutterIntlConfig['structure']) {
        _localizationDetails!.add(
          LocalizationDetails.fromMap(
            (d as yaml.YamlMap).map((k, v) => MapEntry(k, v)).values.first,
          ),
        );
      }
    }

    _mainLocale = flutterIntlConfig['main_locale'] is String
        ? flutterIntlConfig['main_locale']
        : null;
    _useDeferredLoading = flutterIntlConfig['use_deferred_loading'] is bool
        ? flutterIntlConfig['use_deferred_loading']
        : null;
  }

  bool? get enabled => _enabled;

  // String? get className => _className;

  List<LocalizationDetails>? get localizationDetails => _localizationDetails;

  String? get mainLocale => _mainLocale;

  // String? get arbDir => _arbDir;

  // String? get outputDir => _outputDir;

  bool? get useDeferredLoading => _useDeferredLoading;
}
