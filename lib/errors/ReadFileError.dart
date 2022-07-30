import './GenericError.dart';

class ReadFileError extends GenericError {
  ReadFileError([String? message]) : super("Read file error", message);
}
