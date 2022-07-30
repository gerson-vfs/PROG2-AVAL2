import './GenericError.dart';

class InvalidFormatError extends GenericError {
  InvalidFormatError([String? message])
      : super("Invalid format error", message);
}
