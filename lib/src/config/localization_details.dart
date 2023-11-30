import 'package:yaml/yaml.dart';

class LocalizationDetails {
  final String arbDir;
  final String outputDir;
  final bool base;
  final String className;

  const LocalizationDetails({
    required this.base,
    required this.arbDir,
    required this.outputDir,
    required this.className,
  });

  factory LocalizationDetails.fromMap(YamlMap yamlMap) {
    return LocalizationDetails(
      base: yamlMap['base'] ?? false,
      arbDir: yamlMap['arb_dir'],
      outputDir: yamlMap['output_dir'],
      className: yamlMap['class_name'],
    );
  }
}
