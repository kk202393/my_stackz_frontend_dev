class ResponseErrorHandler {
  final bool success;
  final String message;

  ResponseErrorHandler({required this.success, required this.message});

  factory ResponseErrorHandler.fromJson(Map<String, dynamic> json) {
    return ResponseErrorHandler(
      success: json['success'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
