import '../models/building.dart';
import '../models/apartment.dart';
import '../models/elevator.dart';
import '../models/apartment_type.dart';
import '../models/service_status.dart';
import '../services/building_service.dart';


List<Building> buildings= [];

void testBuilding(){
  var safaElevator1=  Elevator(id:1, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;
  var safaElevator2=  Elevator(id:2, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;
  var starElevator1=  Elevator(id:3, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;


  var office1 =  Apartment(num: 1, apartmentType: ApartmentType.office, price: 555);
  var safa = Building(buildingName: 'safa', cityName: 'tadmor', numFloors: 3, elevators: [safaElevator1,safaElevator2], apartments: [office1]);
  var star = Building( buildingName: 'star', cityName: 'nablus', numFloors: 2, elevators: [starElevator1], apartments: []);
  var quds = Building( buildingName: 'quds', cityName: 'nablus', numFloors: 2, elevators: [], apartments: []);
  buildings= [safa,star];
  buildings.add(quds);
  var tadmor = Building.tadmor(buildings);
  printFirstBuildingInTadmorResult(tadmor);
  var byId = Building.findById(buildings, 12);
  printBuildingByIdResult(byId);
  print('\n\n');

  print('before update starElevator1');
  print(star.toString());
  print('\n');
  var updatedStarElevator1 = starElevator1.updateElevator(serviceStatus: ServiceStatus.outOfService);
  updateBuildingElevator(building: star, oldElevator:starElevator1, newElevator:updatedStarElevator1 );
  print('after update starElevator1');
  print(star.toString());
  print('\n\n');

  print('before update office1');
  print(safa.toString());
  print('\n');
  var updatedOffice1 = office1.updateApartment(price:987);
  updateBuildingApartment(building: safa, oldApartment:office1, newApartment:updatedOffice1 );
  print('after update office1');
  print(safa.toString());
  print('\n\n');


  List<Building> nablusBuildings= Building.allBuildingsInNablus([safa,star,quds]);
  for (Building building in nablusBuildings) {
    print(building.toString());
  }
  print('\n\n');

  print('buildings before update quds');
  for (Building building in buildings) {
    print(building.toString());
  }
  print('\n');
  var updatedQuds = quds.updateBuildingInfo(buildingName: 'quds1');
  buildings = updatedBuildings(buildings:buildings, oldBuilding: quds, newBuilding: updatedQuds);
  print('is updated building reference to the old one? ${identical(quds, updatedQuds)}');

  print('buildings after update quds');
  for (Building building in buildings) {
    print(building.toString());
  }


}





