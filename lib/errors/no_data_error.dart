import './generic_error.dart';

class NoDataError extends GenericError {
  NoDataError([String? message]) : super("No data error", message);
}
