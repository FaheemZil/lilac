class ChatMessagesResponse {
  final List<Customer>? data;
  final List<UserSettings>? included;
  final Meta? meta;
  final Links? links;

  ChatMessagesResponse({this.data, this.included, this.meta, this.links});

  factory ChatMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessagesResponse(
      data: json['data'] != null
          ? List<Customer>.from(json['data'].map((x) => Customer.fromJson(x)))
          : null,
      included: json['included'] != null
          ? List<UserSettings>.from(
              json['included'].map((x) => UserSettings.fromJson(x)),
            )
          : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((x) => x.toJson()).toList(),
      'included': included?.map((x) => x.toJson()).toList(),
      'meta': meta?.toJson(),
      'links': links?.toJson(),
    };
  }
}

class Customer {
  final String? type;
  final String? id;
  final CustomerAttributes? attributes;
  final Relationships? relationships;

  Customer({this.type, this.id, this.attributes, this.relationships});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      type: json['type'],
      id: json['id'],
      attributes: json['attributes'] != null
          ? CustomerAttributes.fromJson(json['attributes'])
          : null,
      relationships: json['relationships'] != null
          ? Relationships.fromJson(json['relationships'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'attributes': attributes?.toJson(),
      'relationships': relationships?.toJson(),
    };
  }
}

class CustomerAttributes {
  final String? messageReceivedFromPartnerAt;
  final int? authUserId;
  final String? name;
  final String? username;
  final String? email;
  final String? profilePhotoPath;
  final String? profilePhotoId;
  final String? phone;
  final String? gender;
  final int? countryId;
  final String? countryName;
  final int? stateId;
  final String? stateName;
  final int? cityId;
  final String? cityName;
  final String? customCityName;
  final bool? isActive;
  final String? customerCode;
  final bool? isPremiumCustomer;
  final bool? isOnline;
  final String? bioIntroText;
  final String? lastActiveAt;
  final String? address;
  final String? dateOfBirth;
  final int? nativeLanguageId;
  final String? nativeLanguageName;
  final String? referralCode;
  final String? referredBy;
  final int? referredId;
  final bool? isVanishModeEnabled;
  final bool? isChatInitiated;
  final String? likebackCreatedAt;
  final String? profilePhotoUrl;
  final String? square100ProfilePhotoUrl;
  final String? square300ProfilePhotoUrl;
  final String? square500ProfilePhotoUrl;
  final int? age;

  CustomerAttributes({
    this.messageReceivedFromPartnerAt,
    this.authUserId,
    this.name,
    this.username,
    this.email,
    this.profilePhotoPath,
    this.profilePhotoId,
    this.phone,
    this.gender,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.customCityName,
    this.isActive,
    this.customerCode,
    this.isPremiumCustomer,
    this.isOnline,
    this.bioIntroText,
    this.lastActiveAt,
    this.address,
    this.dateOfBirth,
    this.nativeLanguageId,
    this.nativeLanguageName,
    this.referralCode,
    this.referredBy,
    this.referredId,
    this.isVanishModeEnabled,
    this.isChatInitiated,
    this.likebackCreatedAt,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
  });

  factory CustomerAttributes.fromJson(Map<String, dynamic> json) {
    return CustomerAttributes(
      messageReceivedFromPartnerAt: json['message_received_from_partner_at'],
      authUserId: json['auth_user_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      profilePhotoPath: json['profile_photo_path'],
      profilePhotoId: json['profile_photo_id'],
      phone: json['phone'],
      gender: json['gender'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      customCityName: json['custom_city_name'],
      isActive: json['is_active'],
      customerCode: json['customer_code'],
      isPremiumCustomer: json['is_premium_customer'],
      isOnline: json['is_online'],
      bioIntroText: json['bio_intro_text'],
      lastActiveAt: json['last_active_at'],
      address: json['address'],
      dateOfBirth: json['date_of_birth'],
      nativeLanguageId: json['native_language_id'],
      nativeLanguageName: json['native_language_name'],
      referralCode: json['referral_code'],
      referredBy: json['referred_by'],
      referredId: json['referred_id'],
      isVanishModeEnabled: json['is_vanish_mode_enabled'],
      isChatInitiated: json['is_chat_initiated'],
      likebackCreatedAt: json['likeback_created_at'],
      profilePhotoUrl: json['profile_photo_url'],
      square100ProfilePhotoUrl: json['square100_profile_photo_url'],
      square300ProfilePhotoUrl: json['square300_profile_photo_url'],
      square500ProfilePhotoUrl: json['square500_profile_photo_url'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_received_from_partner_at': messageReceivedFromPartnerAt,
      'auth_user_id': authUserId,
      'name': name,
      'username': username,
      'email': email,
      'profile_photo_path': profilePhotoPath,
      'profile_photo_id': profilePhotoId,
      'phone': phone,
      'gender': gender,
      'country_id': countryId,
      'country_name': countryName,
      'state_id': stateId,
      'state_name': stateName,
      'city_id': cityId,
      'city_name': cityName,
      'custom_city_name': customCityName,
      'is_active': isActive,
      'customer_code': customerCode,
      'is_premium_customer': isPremiumCustomer,
      'is_online': isOnline,
      'bio_intro_text': bioIntroText,
      'last_active_at': lastActiveAt,
      'address': address,
      'date_of_birth': dateOfBirth,
      'native_language_id': nativeLanguageId,
      'native_language_name': nativeLanguageName,
      'referral_code': referralCode,
      'referred_by': referredBy,
      'referred_id': referredId,
      'is_vanish_mode_enabled': isVanishModeEnabled,
      'is_chat_initiated': isChatInitiated,
      'likeback_created_at': likebackCreatedAt,
      'profile_photo_url': profilePhotoUrl,
      'square100_profile_photo_url': square100ProfilePhotoUrl,
      'square300_profile_photo_url': square300ProfilePhotoUrl,
      'square500_profile_photo_url': square500ProfilePhotoUrl,
      'age': age,
    };
  }
}

class Relationships {
  final BlockedContacts? blockedContacts;
  final UserSettingsData? userSettings;

  Relationships({this.blockedContacts, this.userSettings});

  factory Relationships.fromJson(Map<String, dynamic> json) {
    return Relationships(
      blockedContacts: json['blockedContacts'] != null
          ? BlockedContacts.fromJson(json['blockedContacts'])
          : null,
      userSettings: json['userSettings'] != null
          ? UserSettingsData.fromJson(json['userSettings'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blockedContacts': blockedContacts?.toJson(),
      'userSettings': userSettings?.toJson(),
    };
  }
}

class BlockedContacts {
  final List<dynamic>? data;

  BlockedContacts({this.data});

  factory BlockedContacts.fromJson(Map<String, dynamic> json) {
    return BlockedContacts(
      data: json['data'] != null ? List<dynamic>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data};
  }
}

class UserSettingsData {
  final String? type;
  final String? id;

  UserSettingsData({this.type, this.id});

  factory UserSettingsData.fromJson(Map<String, dynamic> json) {
    return UserSettingsData(type: json['type'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'id': id};
  }
}

class UserSettings {
  final String? type;
  final String? id;
  final UserSettingsAttributes? attributes;

  UserSettings({this.type, this.id, this.attributes});

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      type: json['type'],
      id: json['id'],
      attributes: json['attributes'] != null
          ? UserSettingsAttributes.fromJson(json['attributes'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'id': id, 'attributes': attributes?.toJson()};
  }
}

class UserSettingsAttributes {
  final int? userId;
  final bool? isRealGiftsAccepted;
  final bool? isGenderRevealed;
  final bool? isHeightRevealed;
  final bool? isReligionRevealed;
  final bool? isDrinkingHabitRevealed;
  final bool? isSmokingHabitRevealed;
  final bool? isSexualOrientationRevealed;
  final bool? isEducationalQualificationRevealed;
  final bool? isPersonalityTraitsRevealed;
  final bool? isLifestyleActivitiesRevealed;
  final bool? isContactDiscoveryEnabled;
  final bool? isGhostModeEnabled;
  final bool? isDarkModeEnabled;
  final bool? isReceivingPushNotifications;
  final bool? isReceivingFlashMessages;
  final bool? isLastSeenEnabled;
  final bool? isOnlineStatusEnabled;
  final bool? isReadReceiptsEnabled;

  UserSettingsAttributes({
    this.userId,
    this.isRealGiftsAccepted,
    this.isGenderRevealed,
    this.isHeightRevealed,
    this.isReligionRevealed,
    this.isDrinkingHabitRevealed,
    this.isSmokingHabitRevealed,
    this.isSexualOrientationRevealed,
    this.isEducationalQualificationRevealed,
    this.isPersonalityTraitsRevealed,
    this.isLifestyleActivitiesRevealed,
    this.isContactDiscoveryEnabled,
    this.isGhostModeEnabled,
    this.isDarkModeEnabled,
    this.isReceivingPushNotifications,
    this.isReceivingFlashMessages,
    this.isLastSeenEnabled,
    this.isOnlineStatusEnabled,
    this.isReadReceiptsEnabled,
  });

  factory UserSettingsAttributes.fromJson(Map<String, dynamic> json) {
    return UserSettingsAttributes(
      userId: json['user_id'],
      isRealGiftsAccepted: json['is_real_gifts_accepted'],
      isGenderRevealed: json['is_gender_revealed'],
      isHeightRevealed: json['is_height_revealed'],
      isReligionRevealed: json['is_religion_revealed'],
      isDrinkingHabitRevealed: json['is_drinking_habit_revealed'],
      isSmokingHabitRevealed: json['is_smoking_habit_revealed'],
      isSexualOrientationRevealed: json['is_sexual_orientation_revealed'],
      isEducationalQualificationRevealed:
          json['is_educational_qualification_revealed'],
      isPersonalityTraitsRevealed: json['is_personality_traits_revealed'],
      isLifestyleActivitiesRevealed: json['is_lifestyle_activities_revealed'],
      isContactDiscoveryEnabled: json['is_contact_discovery_enabled'],
      isGhostModeEnabled: json['is_ghost_mode_enabled'],
      isDarkModeEnabled: json['is_dark_mode_enabled'],
      isReceivingPushNotifications: json['is_receiving_push_notifications'],
      isReceivingFlashMessages: json['is_receiving_flash_messages'],
      isLastSeenEnabled: json['is_last_seen_enabled'],
      isOnlineStatusEnabled: json['is_online_status_enabled'],
      isReadReceiptsEnabled: json['is_read_receipts_enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'is_real_gifts_accepted': isRealGiftsAccepted,
      'is_gender_revealed': isGenderRevealed,
      'is_height_revealed': isHeightRevealed,
      'is_religion_revealed': isReligionRevealed,
      'is_drinking_habit_revealed': isDrinkingHabitRevealed,
      'is_smoking_habit_revealed': isSmokingHabitRevealed,
      'is_sexual_orientation_revealed': isSexualOrientationRevealed,
      'is_educational_qualification_revealed':
          isEducationalQualificationRevealed,
      'is_personality_traits_revealed': isPersonalityTraitsRevealed,
      'is_lifestyle_activities_revealed': isLifestyleActivitiesRevealed,
      'is_contact_discovery_enabled': isContactDiscoveryEnabled,
      'is_ghost_mode_enabled': isGhostModeEnabled,
      'is_dark_mode_enabled': isDarkModeEnabled,
      'is_receiving_push_notifications': isReceivingPushNotifications,
      'is_receiving_flash_messages': isReceivingFlashMessages,
      'is_last_seen_enabled': isLastSeenEnabled,
      'is_online_status_enabled': isOnlineStatusEnabled,
      'is_read_receipts_enabled': isReadReceiptsEnabled,
    };
  }
}

class Meta {
  final Pagination? pagination;

  Meta({this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }
}

class Pagination {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'per_page': perPage,
      'current_page': currentPage,
      'total_pages': totalPages,
    };
  }
}

class Links {
  final String? self;
  final String? first;
  final String? last;

  Links({this.self, this.first, this.last});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(self: json['self'], first: json['first'], last: json['last']);
  }

  Map<String, dynamic> toJson() {
    return {'self': self, 'first': first, 'last': last};
  }
}
