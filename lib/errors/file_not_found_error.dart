import 'generic_error.dart';

class FileNotFoundError extends GenericError {
  final String path;
  FileNotFoundError(this.path, [String? message])
      : super("File not found error", path);
}
