import './GenericError.dart';

class NoDataError extends GenericError {
  NoDataError([String? message]) : super("No data error", message);
}
