import 'dart:convert';
import 'dart:io' show ProcessResult, stdin, stdout, systemEncoding;
import 'package:eve/cmd/cmd.dart' show cmd, list;
import 'package:process_run/shell.dart';

const String app = "eve";

ShellLinesController controller = ShellLinesController();
Shell shell = Shell(
  throwOnError: false,
  verbose: true,
  runInShell: false,
  stdoutEncoding: systemEncoding,
  stderrEncoding: systemEncoding,
  stdout: controller.sink,
  stderr: controller.sink,
);

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
    } else if (input[0] == "run") {
      String echo = "";
      if (input.length > 1) {
        for (String ins in input.sublist(1)) {
          echo += "$ins ";
        }
      }
      List<ProcessResult> result = await shell.run(echo);
      for (ProcessResult std in result) {
        if (std.exitCode == 0) {
          print(await std.stdout);
        } else {
          print((await std.stderr).toString().trim());
        }
      }
    } else {
      print("Invalid command : $input");
    }
  }
}
