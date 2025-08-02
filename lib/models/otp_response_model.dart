class OtpResponseModel {
  final int data;
  final bool status;
  final String message;

  OtpResponseModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      data: json['data'] ?? 0,
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}