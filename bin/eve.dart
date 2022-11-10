import 'dart:io' show stdin, stdout;
import 'package:eve/cmd/cmd.dart' show cmd, list;

const String app = "eve";

void main(List<String> args) async {
  bool running = true;
  while (running) {
    stdout.write("> ");
    List<String> input = stdin.readLineSync().toString().trim().split(" ");

    if (list.contains(input[0].toLowerCase())) {
      for (Map<String, dynamic> key in cmd) {
        if (key["name"] == input[0] || key["alias"].contains(input[0])) {
          key["method"](input);
        }
      }
    } else {
      print("Invalid command $input");
    }
  }
}
