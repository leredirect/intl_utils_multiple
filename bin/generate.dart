library intl_utils;

import 'package:intl_utils/intl_utils.dart';
import 'package:intl_utils/src/config/localization_details.dart';
import 'package:intl_utils/src/config/pubspec_config.dart';
import 'package:intl_utils/src/constants/constants.dart';
import 'package:intl_utils/src/generator/generator_exception.dart';
import 'package:intl_utils/src/utils/labels_preserver.dart';
import 'package:intl_utils/src/utils/utils.dart';

Future<void> main(List<String> args) async {
  try {
    final PubspecConfig config = PubspecConfig();
    final List<LocalizationDetails>? details = config.localizationDetails;
    if (details == null) {
      throw Exception('no structure initialized');
    }
    final baseClassName = config.baseClassName ?? defaultBaseClassName;
    final baseClassPath = config.baseClassPath ?? defaultBaseClassPath;
    await Generator.generateBaseClass(
        baseClassPath: baseClassPath, baseClassName: baseClassName);
    for (var detailItem in details) {
      var generator = Generator(
        details: detailItem,
        baseClassName: baseClassName,
        baseClassPath: baseClassPath,
        mainLocale: config.mainLocale,
        useDeferredLoading: config.useDeferredLoading,
      );
      await generator.generateAsync();
    }
    await Generator.generateWidget(
      labels: LabelsPreserver().labels,
      widgetPath: config.widgetPath ?? defaultWidgetPath,
      baseClassName: baseClassName,
      baseClassPath: baseClassPath,
    );
  } on GeneratorException catch (e) {
    exitWithError(e.message);
  } catch (e) {
    exitWithError('Failed to generate localization files.\n$e');
  }
}
