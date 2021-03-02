class ErrorInfo {
  ErrorInfo({
    this.bloc,
    this.error,
    this.timestamp,
    this.stackTrace,
  });

  final String? bloc;
  final Object? error;
  final DateTime? timestamp;
  final StackTrace? stackTrace;
}
