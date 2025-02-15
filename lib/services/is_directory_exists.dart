import 'dart:io';

import 'package:status_saver/constants.dart';
import 'package:status_saver/models/tab_type.dart';

Future<bool> isDirectoryExists({required TabType tabType}) async {
  final List<String> directoryPaths = tabType == TabType.recent
      ? recentDirectoryPaths
      : const [savedStatusesDirectory];

  for (String directoryPath in directoryPaths) {
    bool isDirExists = await Directory(directoryPath).exists();
    if (isDirExists) return true;
  }
  return false;
}
