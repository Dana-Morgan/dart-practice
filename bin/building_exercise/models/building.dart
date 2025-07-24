import 'apartment.dart';
import 'elevator.dart';

class Building{
  static int _counter = 0;

  final int? buildingId;
  final String buildingName;
  final String cityName;
  final int numFloors;
  final List<Elevator> elevators ;
  final List<Apartment> apartments;

  Building({
    int? buildingId,
    required this.buildingName,
    required this.cityName,
    required this.numFloors,
    required this.elevators,
    required this.apartments
  }): buildingId = buildingId ?? ++_counter;

  factory Building.tadmor(List<Building>buildings){
    return buildings.firstWhere((building) => building.cityName == 'tadmor',
        orElse: () {
      return Building(
        buildingId: -1,
        buildingName: 'Unknown',
        cityName: 'Unknown',
        numFloors: 0,
        elevators: [],
        apartments: [],
      );
    },
    );
  }

  factory Building.findById(List<Building> buildings, int id) {
    return buildings.firstWhere(
          (b) => b.buildingId == id,
      orElse: () {
        return Building(
          buildingId: -1,
          buildingName: 'Unknown',
          cityName: 'Unknown',
          numFloors: 0,
          elevators: [],
          apartments: [],
        );
      },
    );
  }

  static List<Building> allBuildingsInNablus(List<Building> buildings) {
    return buildings
        .where((building) => building.cityName.toLowerCase() == 'nablus')
        .toList();
  }

  @override
  String toString() {
    return 'building name: ${this.buildingName} with id: ${this.buildingId} , elevators: ${this.elevators}, apartments: ${this.apartments}' ;
  }

  Building updateBuildingInfo({int? buildingId, String? buildingName,
    String? cityName, int? numFloors, List<Elevator>? elevators,
    List<Apartment>? apartments }){

    return Building(buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        cityName: cityName ?? this.cityName,
        numFloors: numFloors ?? this.numFloors,
        elevators: elevators ?? this.elevators,
        apartments: apartments ?? this.apartments);
  }

}
