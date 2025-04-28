class Pokemon {
  final String name;
  final String imgUrl;
  List<Evolution>? evolutions;

  Pokemon({required this.name, required this.imgUrl, this.evolutions});
}

class Evolution {
  final String name;
  final String imgUrl;

  Evolution({required this.name, required this.imgUrl});
}
