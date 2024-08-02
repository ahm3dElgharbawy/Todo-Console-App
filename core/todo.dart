import 'dart:io';
import 'ansi_colors.dart';

class Todo {
  late File file;
  Todo({required String filePath}) {
    file = File(filePath);
  }

  List<String> read() {
    if (file.existsSync()) {
      return file
          .readAsLinesSync()
          .asMap()
          .map<int, String>(
            (i, line) =>
                MapEntry(i, '${i + 1}) ${colorize(line, AnsiColor.green)}'),
          )
          .values
          .toList();
    }
    return [colorize("No Tasks yet", AnsiColor.red)];
  }

  void write(String todo) async {
    await file.writeAsString('$todo\n', mode: FileMode.append);
  }

  void delete() async {
    if (await file.exists()) {
      await file.delete();
    }
  }

  removeLine(int lineNumber) {
    List<String> lines = file.readAsLinesSync();
    if (lineNumber < 1 || lineNumber > lines.length) {
      print('Invalid line number.');
      return;
    }
    lines.removeAt(lineNumber - 1); // Line numbers are 1-based

    file.writeAsStringSync(lines.join('\n'));

    print('Line $lineNumber has been removed.');
  }

  // Get total number of tasks
  void size() {
    print(read().length);
  }

  void showUsage() {
    print(colorize("Usage:", AnsiColor.red));
    print(colorize("--add <task> or -a <task>     |  Add a new todo", AnsiColor.red),);
    print(colorize("--list or -l                  |  List all todo's", AnsiColor.red));
    print(colorize("--clear or -c                 |  Delete all todo's", AnsiColor.red));
    print(colorize("--size                        |  Get the number of todo's",AnsiColor.red));
    print(colorize("--remove <line> or -r <line>  |  Remove a specific line'",AnsiColor.red));
  }
}
