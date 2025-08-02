class Services {
  static final Services _instance = Services._internal();
  factory Services() => _instance;
  Services._internal();

  static Services get instance => _instance;
}
