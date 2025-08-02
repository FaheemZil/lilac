class ContactUsersResponse {
  final List<ContactUser> data;
  final Meta meta;
  final Links links;

  ContactUsersResponse({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory ContactUsersResponse.fromJson(Map<String, dynamic> json) {
    return ContactUsersResponse(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => ContactUser.fromJson(item))
          .toList(),
      meta: Meta.fromJson(json['meta'] ?? {}),
      links: Links.fromJson(json['links'] ?? {}),
    );
  }
}

class ContactUser {
  final String type;
  final String id;
  final ContactUserAttributes attributes;

  ContactUser({
    required this.type,
    required this.id,
    required this.attributes,
  });

  factory ContactUser.fromJson(Map<String, dynamic> json) {
    return ContactUser(
      type: json['type'] ?? '',
      id: json['id'] ?? '',
      attributes: ContactUserAttributes.fromJson(json['attributes'] ?? {}),
    );
  }
}

class ContactUserAttributes {
  final String? messageReceivedFromPartnerAt;
  final int? authUserId;
  final String name;
  final String username;
  final String email;
  final String? profilePhotoPath;
  final String? profilePhotoId;
  final String phone;
  final String gender;
  final int? countryId;
  final String? countryName;
  final bool isActive;
  final String customerCode;
  final bool isPremiumCustomer;
  final bool isOnline;
  final String? bioIntroText;
  final String? lastActiveAt;
  final String? dateOfBirth;
  final int? nativeLanguageId;
  final String? nativeLanguageName;
  final String? profilePhotoUrl;
  final String? square100ProfilePhotoUrl;
  final String? square300ProfilePhotoUrl;
  final String? square500ProfilePhotoUrl;
  final int? age;

  ContactUserAttributes({
    this.messageReceivedFromPartnerAt,
    this.authUserId,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhotoPath,
    this.profilePhotoId,
    required this.phone,
    required this.gender,
    this.countryId,
    this.countryName,
    required this.isActive,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.isOnline,
    this.bioIntroText,
    this.lastActiveAt,
    this.dateOfBirth,
    this.nativeLanguageId,
    this.nativeLanguageName,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
  });

  factory ContactUserAttributes.fromJson(Map<String, dynamic> json) {
    return ContactUserAttributes(
      messageReceivedFromPartnerAt: json['message_received_from_partner_at'],
      authUserId: json['auth_user_id'],
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      profilePhotoPath: json['profile_photo_path'],
      profilePhotoId: json['profile_photo_id'],
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      countryId: json['country_id'],
      countryName: json['country_name'],
      isActive: json['is_active'] ?? false,
      customerCode: json['customer_code'] ?? '',
      isPremiumCustomer: json['is_premium_customer'] ?? false,
      isOnline: json['is_online'] ?? false,
      bioIntroText: json['bio_intro_text'],
      lastActiveAt: json['last_active_at'],
      dateOfBirth: json['date_of_birth'],
      nativeLanguageId: json['native_language_id'],
      nativeLanguageName: json['native_language_name'],
      profilePhotoUrl: json['profile_photo_url'],
      square100ProfilePhotoUrl: json['square100_profile_photo_url'],
      square300ProfilePhotoUrl: json['square300_profile_photo_url'],
      square500ProfilePhotoUrl: json['square500_profile_photo_url'],
      age: json['age'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      perPage: json['per_page'] ?? 0,
      currentPage: json['current_page'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
    );
  }
}

class Links {
  final String? self;
  final String? first;
  final String? next;
  final String? last;

  Links({
    this.self,
    this.first,
    this.next,
    this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
      first: json['first'],
      next: json['next'],
      last: json['last'],
    );
  }
}