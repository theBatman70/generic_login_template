import 'package:flutter/material.dart';
import 'package:mynotes/core/app_export.dart';
import 'package:mynotes/presentation/adacana_screen/models/adacana_model.dart';

/// A provider class for the AdacanaScreen.
///
/// This provider manages the state of the AdacanaScreen, including the
/// current adacanaModelObj

// ignore_for_file: must_be_immutable
class AdacanaProvider extends ChangeNotifier {
  AdacanaModel adacanaModelObj = AdacanaModel();

  @override
  void dispose() {
    super.dispose();
  }
}
