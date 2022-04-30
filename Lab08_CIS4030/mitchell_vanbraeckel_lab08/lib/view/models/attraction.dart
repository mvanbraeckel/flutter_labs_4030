
class Attraction {
  final String title;
  final String address;
  final String description;
  final String imageUrl;
  final bool isFree;
  final List<String> categories;

  Attraction({
    required this.title,
    required this.address,
    required this.description,
    required this.imageUrl,
    required this.isFree,
    required this.categories
  });
}