class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String street;
  final UserLocationCoordinates coordinates;
  final UserLocationTimezone timezone;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.street,
      required this.coordinates,
      required this.timezone});

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = UserLocationCoordinates.fromMap(json["coordinates"]);
    final timezone = UserLocationTimezone.fromMap(json["timezone"]);
    final street = LocationStreet.fromMap(json["street"]);
    return UserLocation(
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"].toString(),
        street: street.toString(),
        coordinates: coordinates,
        timezone: timezone);
  }
}

class UserLocationCoordinates {
  final String latitude;
  final String longitude;

  UserLocationCoordinates({required this.latitude, required this.longitude});

  factory UserLocationCoordinates.fromMap(Map<String, dynamic> json) {
    return UserLocationCoordinates(
        latitude: json["latitude"], longitude: json["longitude"]);
  }
}

class UserLocationTimezone {
  final String offSet;
  final String description;

  UserLocationTimezone({required this.offSet, required this.description});

  factory UserLocationTimezone.fromMap(Map<String, dynamic> json) {
    return UserLocationTimezone(
        offSet: json["offset"], description: json["description"]);
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(number: json["number"], name: json["name"]);
  }
}
