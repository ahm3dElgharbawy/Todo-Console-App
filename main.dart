import 'dart:io';
import 'core/todo.dart';

void main(List<String> arguments) async {
  // Get the directory of the script
  final scriptDir = File(Platform.resolvedExecutable).parent.path;
  Todo todo = Todo(filePath: "$scriptDir\\todo.txt");
  try {
    switch (arguments[0]) {
      case "--add" || "-a":
        todo.write(arguments[1]);
        todo.read();
        break;
      case "--list" || "-l":
        todo.read().forEach((line) => print(line));
        break;
      case "--clear" || "-c":
        todo.delete();
        break;
      case "--remove" || "-r":
        todo.removeLine(int.parse(arguments[1]));
        break;
      case "--size":
        todo.size();
      default:
        todo.showUsage();
    }
  } catch (e) {
    todo.showUsage();
  }
}




