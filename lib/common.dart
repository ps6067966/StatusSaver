import 'package:flutter/material.dart';

export 'package:flutter/material.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

void log(String message) {
  debugPrint("---------------------------------------------");
  debugPrint(message);
  debugPrint("---------------------------------------------");
}

void pop(BuildContext context) {
  return Navigator.of(context).pop();
}
