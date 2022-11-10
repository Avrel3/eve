import 'dart:io' show Directory, FileSystemEntity;

import 'package:eve/sys/env.dart' show env;

String currentDir() => Directory.current.path;

void md(List<String> dir) {
  List<String> folders = [];

  if (dir.isNotEmpty) {
    for (String i in dir) {
      if (i.startsWith("\$")) {
        folders.add(env[i.replaceFirst("\$", "")] ?? i);
      } else {
        folders.add(i);
      }
    }
  } else {
    folders.add("New_Folder");
  }

  try {
    for (String folder in folders) {
      Directory(folder).createSync(recursive: true);
    }
  } catch (e) {
    print("Couldn't make folder");
  }
}

void rm(List<String> dir) {
  List<String> folders = [];

  if (dir.isNotEmpty) {
    for (String i in dir) {
      if (i.startsWith("\$")) {
        folders.add(env[i.replaceFirst("\$", "")] ?? i);
      } else {
        folders.add(i);
      }
    }
  } else {
    return;
  }

  try {
    for (String folder in folders) {
      Directory(folder).deleteSync(recursive: true);
    }
  } catch (e) {
    print("Couldn't remove folder");
  }
}

void ls(List<String> list) {
  try {
    List<FileSystemEntity> entries = Directory(list.length > 1 ? list[1] : ".")
        .listSync(recursive: false, followLinks: true)
        .toList();
    for (FileSystemEntity entry in entries) {
      print(entry.uri);
    }
  } catch (e) {
    print("Couldn't list contents");
  }
}

void newDir(List<String> args) async {
  try {
    if (args.length > 2) {
      Directory(args[1]).renameSync(args[2]);
    } else {
      print("Incomplete arguments to rename folder");
    }
  } catch (e) {
    print("Couldn't rename folder");
  }
}

void changeDir(String args) {
  try {
    Directory.current = args;
    print(Directory.current.path);
  } catch (e) {
    print("Couldn't change directory");
  }
}
