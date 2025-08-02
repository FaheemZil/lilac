class AuthResponseModel {
  final CustomerData data;

  AuthResponseModel({required this.data});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      data: CustomerData.fromJson(json['data']),
    );
  }
}

class CustomerData {
  final String type;
  final String id;
  final CustomerAttributes attributes;

  CustomerData({
    required this.type,
    required this.id,
    required this.attributes,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      attributes: CustomerAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class CustomerAttributes {
  final String name;
  final String username;
  final String email;
  final String? dateOfBirth;
  final String phone;
  final String gender;
  final String? address;
  final bool isActive;
  final int coinBalance;
  final String customerCode;
  final bool isPremiumCustomer;
  final int profileCompletionPercentage;
  final String? preferredGender;
  final String? profilePhotoUrl;
  final String? square100ProfilePhotoUrl;
  final String? square300ProfilePhotoUrl;
  final String? square500ProfilePhotoUrl;
  final int? age;
  final AuthStatus? authStatus;

  CustomerAttributes({
    required this.name,
    required this.username,
    required this.email,
    this.dateOfBirth,
    required this.phone,
    required this.gender,
    this.address,
    required this.isActive,
    required this.coinBalance,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.profileCompletionPercentage,
    this.preferredGender,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
    this.authStatus,
  });

  factory CustomerAttributes.fromJson(Map<String, dynamic> json) {
    return CustomerAttributes(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      dateOfBirth: json['date_of_birth'],
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'],
      isActive: json['is_active'] ?? false,
      coinBalance: json['coin_balance'] ?? 0,
      customerCode: json['customer_code'] ?? '',
      isPremiumCustomer: json['is_premium_customer'] ?? false,
      profileCompletionPercentage: json['profile_completion_percentage'] ?? 0,
      preferredGender: json['preferred_gender'],
      profilePhotoUrl: json['profile_photo_url'],
      square100ProfilePhotoUrl: json['square100_profile_photo_url'],
      square300ProfilePhotoUrl: json['square300_profile_photo_url'],
      square500ProfilePhotoUrl: json['square500_profile_photo_url'],
      age: json['age'],
      authStatus: json['auth_status'] != null 
          ? AuthStatus.fromJson(json['auth_status']) 
          : null,
    );
  }
}

class AuthStatus {
  final String accessToken;
  final String tokenType;
  final bool is2faConfiguredByUser;
  final bool is2faVerifiedByUser;
  final bool isEmailVerificationRequired;

  AuthStatus({
    required this.accessToken,
    required this.tokenType,
    required this.is2faConfiguredByUser,
    required this.is2faVerifiedByUser,
    required this.isEmailVerificationRequired,
  });

  factory AuthStatus.fromJson(Map<String, dynamic> json) {
    return AuthStatus(
      accessToken: json['access_token'] ?? '',
      tokenType: json['token_type'] ?? '',
      is2faConfiguredByUser: json['is_2fa_configured_by_user'] ?? false,
      is2faVerifiedByUser: json['is_2fa_verified_by_user'] ?? false,
      isEmailVerificationRequired: json['is_email_verification_required'] ?? false,
    );
  }
}