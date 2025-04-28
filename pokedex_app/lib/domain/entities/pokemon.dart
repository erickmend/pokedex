class Pokemon {
  final String name;
  final String imgUrl;
  final List<Evolution>? evolutions;

  Pokemon({required this.name, required this.imgUrl, required this.evolutions});

}

class Evolution {
  final String name;
  final String imgUrl;

  Evolution({required this.name, required this.imgUrl});
}
