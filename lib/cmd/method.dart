import 'dart:io' show exit, stdout;

import 'package:eve/dir/dir.dart';
import 'package:eve/sys/sys.dart';
import 'package:eve/cmd/cmd.dart';

void help(List<String> _) {
  print(cmd);
}

void show(List<String> input) {
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
    stdout.writeln("< $echo");
  }
}

Function mkdir = md;

void q(List<String> _) {
  exit(0);
}
