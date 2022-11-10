import 'package:eve/cmd/method.dart'
    show
        cd,
        content,
        current,
        echo,
        execute,
        help,
        mkdir,
        q,
        readFile,
        remove,
        rmdir,
        touch;
import 'package:eve/sys/dir.dart' show newDir;
import 'package:eve/sys/file.dart' show newFile;

final List<Map<String, dynamic>> cmd = [
  {
    "name": "help",
    "description": "Lists all commands",
    "alias": ["h"],
    "method": help
  },
  {
    "name": "echo",
    "description": "Prints to the command line",
    "alias": ["show"],
    "method": echo
  },
  {
    "name": "mkdir",
    "description": "Creates directory",
    "alias": ["md", "mk"],
    "method": mkdir
  },
  {
    "name": "rmdir",
    "description": "Deletes directory",
    "alias": ["rm", "rd"],
    "method": rmdir
  },
  {
    "name": "touch",
    "description": "Creates file",
    "alias": ["make"],
    "method": touch
  },
  {
    "name": "remove",
    "description": "Deletes file",
    "alias": ["del"],
    "method": remove
  },
  {
    "name": "list",
    "description": "Lists content in directory",
    "alias": ["ls", "dir"],
    "method": content
  },
  {
    "name": "current",
    "description": "Current Directory",
    "alias": ["here"],
    "method": current
  },
  {
    "name": "rename",
    "description": "Renames a file",
    "alias": ["rnm"],
    "method": newFile
  },
  {
    "name": "rnmdir",
    "description": "Renames a directory",
    "alias": ["rn"],
    "method": newDir
  },
  {
    "name": "cd",
    "description": "Change directory",
    "alias": [],
    "method": cd,
  },
  {
    "name": "read",
    "description": "Reads a file",
    "alias": [],
    "method": readFile,
  },
  {
    "name": "exit",
    "description": "Exits the Application",
    "alias": ["leave", "q"],
    "method": q
  }
];

final List<String> list = [
  "",
  "help",
  "h",
  "show",
  "echo",
  "mkdir",
  "md",
  "mk",
  "rmdir",
  "rm",
  "rd",
  "make",
  "touch",
  "del",
  "remove",
  "list",
  "ls",
  "dir",
  "current",
  "here",
  "rename",
  "rnm",
  "rnmdir",
  "rn",
  "cd",
  "read",
  "exit",
  "leave",
  "q",
];

final Map<String, List<String>> _alias = {
  "help": ["h"],
  "echo": ["show"],
  "mkdir": ["md", "mk"],
  "rmdir": ["rm", "rd"],
  "touch": ["make"],
  "remove": ["del"],
  "list": ["ls", "dir"],
  "current": ["here"],
  "exit": ["q", "leave"],
  "rename": ["rnm"],
  "rnmdir": ["rn"],
  "cd": [],
  "read": []
};
