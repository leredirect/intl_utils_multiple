library intl_utils;

import 'package:intl_utils/intl_utils.dart';
import 'package:intl_utils/src/config/localization_details.dart';
import 'package:intl_utils/src/config/pubspec_config.dart';
import 'package:intl_utils/src/generator/generator_exception.dart';
import 'package:intl_utils/src/utils/utils.dart';

Future<void> main(List<String> args) async {
  try {
    final PubspecConfig config = PubspecConfig();
    final List<LocalizationDetails>? details = config.localizationDetails;
    if (details == null) {
      throw Exception('no structure initialized');
    }
    for (var detailItem in details) {
      var generator = Generator(
        details: detailItem,
        mainLocale: config.mainLocale,
        useDeferredLoading: config.useDeferredLoading,
      );
      await generator.generateAsync();
    }
  } on GeneratorException catch (e) {
    exitWithError(e.message);
  } catch (e) {
    exitWithError('Failed to generate localization files.\n$e');
  }
}
