import '../models/apartment.dart';
import '../models/building.dart';
import '../models/elevator.dart';

List<Building> updatedBuildings({
  required List<Building> buildings,
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
  building.elevators
    ..remove(oldElevator)
    ..add(newElevator);
}

void updateBuildingApartment({
  required Building building,
  required Apartment oldApartment,
  required Apartment newApartment,
}) {
  building.apartments
    ..remove(oldApartment)
    ..add(newApartment);
}

void printBuildingByIdResult(Building building){
  if(building.buildingId==-1){
    print('building with id: 12 not found');
  }else{
    print('the building returns from factory constructor findById is: ${building.buildingName}\n');
  }
}

void printFirstBuildingInTadmorResult(Building building){
  if(building.buildingId==-1){
    print('building with id: 12 not found');
  }else{
    print('the building returns from factory constructor findById is: ${building.buildingName}\n');
  }
}
