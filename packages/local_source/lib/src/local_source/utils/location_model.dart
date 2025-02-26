final class LocationModel {
  const LocationModel({
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  final String locationName;
  final double latitude;
  final double longitude;

  @override
  String toString() => '$locationName#$latitude#$longitude';
}
