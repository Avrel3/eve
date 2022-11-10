import 'dart:io' show exit, stdout;
import 'package:dolumns/dolumns.dart' show dolumnify;

import 'package:eve/sys/dir.dart'
    show changeDir, currentDir, ls, md, newDir, rm;
import 'package:eve/sys/env.dart' show env;
import 'package:eve/cmd/cmd.dart' show cmd;
import 'package:eve/sys/file.dart' show del, exec, make, newFile, read;

void help(List<String> _) {
  List<List<Object>> columns = [
    ["Name", "Alias", "Description"]
  ];
  for (Map<String, dynamic> command in cmd) {
    columns.add([command["name"], command["alias"], command["description"]]);
  }
  final data = dolumnify(columns, columnSplitter: ' | ');
  print(data);
}

void echo(List<String> input) {
  List<String> echos = [];
  String echo = "";
  if (input.length > 1) {
    echos.addAll(input.sublist(1));
    for (String args in echos) {
      if (args.startsWith("\$")) {
        echo += "${env[args.replaceFirst("\$", "")] ?? args} ";
      } else {
        echo += "$args ";
      }
    }
    stdout.writeln(echo);
  }
}

Function mkdir = (List<String> args) {
  md(args.sublist(1));
};

Function rmdir = (List<String> args) {
  rm(args.sublist(1));
};

Function touch = (List<String> args) {
  make(args.sublist(1));
};

Function remove = (List<String> args) {
  del(args.sublist(1));
};

Function content = ls;

Function current = (List<String> _) {
  print(currentDir());
};

void renameDir(List<String> args) {
  newDir(args.sublist(1));
}

void renameFile(List<String> args) {
  newFile(args.sublist(1));
}

void cd(List<String> args) {
  String path = ".";
  if (args.length > 1) {
    path = args[1];
  }
  changeDir(path);
}

void readFile(List<String> args) {
  if (args.length > 1) {
    read(args[1]);
  }
}

void q(List<String> _) {
  exit(0);
}
