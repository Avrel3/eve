import 'dart:io' show stdin, stdout;
import 'package:eve/cmd/app.dart';
import 'package:eve/cmd/cmd.dart' show cmd, list;

const String app = "eve";

void main(List<String> args) async {
  bool running = true;
  while (running) {
    stdout.write("> ");
    List<String> input = stdin.readLineSync().toString().trim().split(" ");

    if (list.contains(input[0].toLowerCase())) {
      for (Map<String, dynamic> key in cmd) {
        if (key["name"] == input[0] || input[0] == key["alias"]) {
          key["method"](input);
        }
      }
    } else if (input[0] == app) {
      master(input.sublist(1));
    } else {
      print("< Invalid command : $input");
    }
  }
}
