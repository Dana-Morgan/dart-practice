import './apartment.dart';
class Owner {
  final int id;
  final String name;
  final List<Apartment> ownedApartments;

  Owner({
    required this.id,
    required this.name,
    List<Apartment>? ownedApartments,
  }) : ownedApartments = ownedApartments ?? [];

  void buyApartment(Apartment apartment) {
    ownedApartments.add(apartment);
  }

  @override
  String toString() {
    return 'Owner $name owns ${ownedApartments.length} apartment(s)';
  }
}
