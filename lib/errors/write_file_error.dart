import 'generic_error.dart';

class WriteFileError extends GenericError {
  WriteFileError([String? message]) : super("Write file error", message);
}
