import './GenericError.dart';

class WriteFileError extends GenericError {
  WriteFileError([String? message]) : super("Write file error", message);
}
