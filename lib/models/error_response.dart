class ErrorResponse<T> {
  final String? message;

  ErrorResponse({this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final data = json['error']['message'];
    return ErrorResponse<T>(message: data as String?);
  }

  String get errorMessage => message ?? 'Unknown error';
}
