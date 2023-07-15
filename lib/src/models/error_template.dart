class ApiError implements Exception {
  ApiError({
    required this.message,
    this.code = 0,
  });

  final String message;
  final int code;
}
