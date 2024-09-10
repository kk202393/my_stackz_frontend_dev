class UpdateBookingResponse {
  final bool? success;
  final String? massage;

  UpdateBookingResponse({this.success, this.massage});

  factory UpdateBookingResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UpdateBookingResponse();

    return UpdateBookingResponse(
      success: json['success'] as bool?,
      massage: json['massage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'massage': massage,
    };
  }
}
