import 'package:intl_utils/src/generator/label.dart';

class LabelsPreserver {
  static final LabelsPreserver _labelsPreserver = LabelsPreserver._internal();

  factory LabelsPreserver() {
    return _labelsPreserver;
  }

  LabelsPreserver._internal();

  final List<Label> _labels = [];

  List<Label> get labels => _labels;

  void updateLabels(List<Label> labels) {
    _labels.addAll(labels);
  }
}
