import 'apartment.dart';
import 'elevator.dart';
import 'building_type.dart';
import 'apartment_type.dart';
import '../services/system.dart';

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
    List<Elevator>? elevators,
    List<Apartment>? apartments
  }):  buildingId = buildingId ?? ++_counter,
        elevators = elevators ?? [],
        apartments = apartments ?? [];



  //will be better to make it as a method in service? to separate responsibilities
  // factory Building.tadmor(List<Building>buildings){
  //   return buildings.firstWhere((building) => building.cityName == 'tadmor' ,
  //       orElse: () => throw Exception('Building not found'));
  // }

  //will be better to make it as a method in service? to separate responsibilities
  // factory Building.findById(List<Building>buildings,int id){
  //   return buildings.firstWhere((building) => building.buildingId == id,
  //       orElse: () => throw Exception('Building not found'),);
  // }

  factory Building.withType({
    required String buildingName,
    required String cityName,
    required int numFloors,
    required List<Elevator> elevators,
    required List<Apartment> apartments,
    required BuildingType type,
    required System system,
  }) {
    for (var elevator in elevators) {
      if (!system.elevators.contains(elevator)) {
        throw Exception('Elevator with id ${elevator.id} isnt in the system');
      }
    }

    for (var apartment in apartments) {
      if (!system.apartments.contains(apartment)) {
        throw Exception('Apartment ${apartment.apartmentNum} isnt  in the system');
      }
    }

    ApartmentType newType;
    switch (type) {
      case BuildingType.residential:
        newType = ApartmentType.apartment;
        break;
      case BuildingType.commercial:
        newType = ApartmentType.office;
        break;
    }

    final updatedApartments = apartments
        .map((apt) => apt.updateApartment(apartmentType: newType))
        .toList();

    for (int i = 0; i < apartments.length; i++) {
      system.apartments.remove(apartments[i]);
      system.apartments.add(updatedApartments[i]);
    }

    final building = Building(
      buildingName: buildingName,
      cityName: cityName,
      numFloors: numFloors,
      elevators: elevators,
      apartments: updatedApartments,
    );

    system.buildings.add(building);
    return building;
  }




// in service to separate responsibilities
//   static List<Building> allBuildingsInNablus(List<Building> buildings) {
//     return buildings
//         .where((building) => building.cityName.toLowerCase() == 'nablus')
//         .toList();
//   }

  @override
  String toString() {
    return 'building name: $buildingName with id: $buildingId , elevators: $elevators, apartments: $apartments' ;
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
