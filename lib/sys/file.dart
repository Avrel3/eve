import 'dart:convert' show utf8;
import 'dart:io' show File;

import 'package:eve/sys/env.dart' show env;

void make(List<String> args) {
  List<String> files = [];

  if (args.isNotEmpty) {
    for (String i in args) {
      if (i.startsWith("\$")) {
        files.add(env[i.replaceFirst("\$", "")] ?? i);
      } else {
        files.add(i);
      }
    }
  } else {
    files.add("New_Text.txt");
  }

  try {
    for (String file in files) {
      File(file).createSync(recursive: true);
    }
  } catch (e) {
    print("Couldn't make file");
  }
}

void del(List<String> args) {
  List<String> files = [];

  if (args.isNotEmpty) {
    for (String i in args) {
      if (i.startsWith("\$")) {
        files.add(env[i.replaceFirst("\$", "")] ?? i);
      } else {
        files.add(i);
      }
    }
  } else {
    return;
  }

  try {
    for (String file in files) {
      File(file).deleteSync(recursive: true);
    }
  } catch (e) {
    print("Couldn't remove file");
  }
}

void newFile(List<String> args) async {
  try {
    if (args.length > 2) {
      File(args[1]).renameSync(args[2]);
    } else {
      print("Incomplete arguments to rename file");
    }
  } catch (e) {
    print("Couldn't rename file");
  }
}

void read(String file) {
  try {
    String contents = File(file).readAsStringSync(encoding: utf8);
    print(contents);
  } catch (e) {
    print("Couldn't read file");
  }
}
