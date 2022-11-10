import 'package:eve/cmd/method.dart' show help, mkdir, q, show;

Object schema = {"name": "", "description": "", "alias": "", "method": () {}};

final List<Map<String, dynamic>> cmd = [
  {
    "name": "help",
    "description": "Lists all commands",
    "alias": "h",
    "method": help
  },
  {
    "name": "show",
    "description": "Prints to the command line",
    "alias": "echo",
    "method": show
  },
  {
    "name": "mkdir",
    "description": "Makes directory",
    "alias": "md",
    "method": mkdir
  },
  {
    "name": "exit",
    "description": "Exits the Application",
    "alias": "q",
    "method": q
  }
];

final List<String> list = [
  "",
  "show",
  "echo",
  "mkdir",
  "md",
  "help",
  "h",
  "exit",
  "q",
];

final Map<String, String> _alias = {
  "help": "h",
  "mkdir": "md",
  "exit": "q",
  "show": "echo"
};
