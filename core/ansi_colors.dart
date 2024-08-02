enum AnsiColor {
  reset('\x1B[0m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  blue('\x1B[34m'),
  yellow('\x1B[33m'),
  cyan('\x1B[36m'),
  magenta('\x1B[35m'),
  white('\x1B[37m'),
  black('\x1B[30m');

  final String code;
  const AnsiColor(this.code);
}

String colorize(String text, AnsiColor color) {
  return '${color.code}$text${AnsiColor.reset.code}';
}
