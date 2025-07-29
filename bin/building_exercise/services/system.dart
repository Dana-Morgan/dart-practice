import '../models/apartment.dart';
import '../models/building.dart';
import '../models/elevator.dart';
import '../models/owner.dart';

class System {
  List<Building> buildings = [];
  List<Apartment> apartments = [];
  List<Elevator> elevators = [];
  List<Owner> owners = [];


  Building addBuilding({
    required buildingName,
    required cityName,
    required numFloors,
    List<Elevator>? elevators,
    List<Apartment>?  apartments
  }) {
    var building = Building(buildingName: buildingName,
        cityName: cityName,
        numFloors: numFloors,
        elevators: elevators,
        apartments: apartments);
    buildings.add(building);
    return building;
  }

  Elevator addElevator({
    required id,
    capacity = 10,
    required serviceStatus,
    required floors
  }) {
    var elevator = Elevator(
        id: id, serviceStatus: serviceStatus, floors: floors);
    elevators.add(elevator);
    return elevator;
  }

  Owner addOwner({required id,
    required name,
    List<Apartment>? ownedApartments
  }) {
    var owner = Owner(id: id, name: name, ownedApartments: ownedApartments);
    owners.add(owner);
    return owner;
  }

  Apartment addApartment({required apartmentNum,
    required apartmentType,
    price, Owner? owner
  }){
    var apartment = Apartment(apartmentNum: apartmentNum, apartmentType: apartmentType, price: price, owner: owner);
    apartments.add(apartment);
    return apartment;
  }

  void addApartmentToOwner({
    required Apartment apartment,
    required Owner owner
  }) {
    owner.buyApartment(apartment);
  }


  List<Building> updatedBuildings({
    required Building oldBuilding,
    required Building newBuilding,
  }) {
    buildings
      ..remove(oldBuilding)
      ..add(newBuilding);
    return buildings;
  }

  void updateBuildingElevator({
    required Building building,
    required Elevator oldElevator,
    required Elevator newElevator,
  }) {
    elevators.remove(oldElevator);
    elevators.add(newElevator);
    building.elevators
      ..remove(oldElevator)
      ..add(newElevator);
    List<Elevator> allElevators = building.elevators;
    building.updateBuildingInfo(elevators: allElevators);
  }

  void updateBuildingApartment({
    required Building building,
    required Apartment oldApartment,
    required Apartment newApartment,
  }) {
    apartments.remove(oldApartment);
    apartments.add(newApartment);
    building.apartments
      ..remove(oldApartment)
      ..add(newApartment);
    List<Apartment> allApartments = building.apartments;
    building.updateBuildingInfo(apartments: allApartments);
  }

  List<Building> allBuildingsInNablus() {
    return buildings
        .where((building) => building.cityName.toLowerCase() == 'nablus')
        .toList();
  }


  Building findById(int id) {
    return buildings.firstWhere((building) => building.buildingId == id,
      orElse: () => throw Exception('Building not found'),);
  }

  Building tadmor(List<Building>buildings) {
    return buildings.firstWhere((building) => building.cityName == 'tadmor',
        orElse: () => throw Exception('Building not found'));
  }

  List<Elevator> allElevators(){
    return elevators;
  }

  List<Apartment> allApartments(){
    return apartments;
  }

  List<Building> allBuildings(){
    return buildings;
  }

}