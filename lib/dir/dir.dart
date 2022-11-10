import 'dart:io';

void md(List<String> dir) {
  List<String> folders = [];

  dir.length > 1 ? folders.addAll(dir.sublist(1)) : folders.add("New Folder");

  try {
    for (String folder in folders) {
      Directory(folder).createSync(recursive: true);
    }
  } catch (e) {
    e;
  }
}
