class Restaurant {
  Restaurant({
    required this.createdAt,
    required this.name,
    required this.imageProfile,
    required this.imageCover,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.id,
  });

  final DateTime createdAt;
  final String name;
  final String imageProfile;
  final String imageCover;
  final String address;
  final int latitude;
  final int longitude;
  final String description;
  final String id;
}
