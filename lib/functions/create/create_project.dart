import 'dart:io';

import 'package:get_cli/common/utils/shell/shel.utils.dart';
import 'package:get_cli/core/structure.dart';
import 'package:get_cli/functions/init/init_chooser.dart';
import 'package:recase/recase.dart';

Future<void> createProject(String name) async {
  String path = name == '.'
      ? Directory.current.path
      : Structure.replaceAsExpected(
          path: Directory.current.path + '/${name.snakeCase}');

  await ShellUtils.flutterCreate(path);
  Directory.current = path;
  await createInitial();
}
