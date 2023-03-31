import 'package:todo_app/data/source/files.dart';
import 'package:todo_app/data/source/files_memory_impt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filesProvider = Provider<Files>((ref) {
  return FileMemoryImpt();
});
