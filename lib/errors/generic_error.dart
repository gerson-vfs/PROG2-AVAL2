class GenericError extends Error {
  final String title;
  final String? message;
  GenericError(this.title, [this.message]);
  String toString() => "$title${message != null ? ": $message" : ""}";
}
