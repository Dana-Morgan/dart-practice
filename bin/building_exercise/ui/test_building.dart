import '../models/building.dart';
import '../models/apartment.dart';
import '../models/apartment_type.dart';
import '../models/service_status.dart';
import '../services/system.dart';

void testBuilding(){
  System system = System();

  var safaElevator1= system.addElevator(id:1, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;
  var safaElevator2= system.addElevator(id:2, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;
  var starElevator1= system.addElevator(id:3, serviceStatus: ServiceStatus.inService, floors: [1,2]) ;
  var owner1 = system.addOwner(id: 12, name: 'dana');

  var office1 =  system.addApartment(apartmentNum: 1, apartmentType: ApartmentType.office, price: 555, owner:owner1);
  system.addApartmentToOwner(owner: owner1, apartment: office1);

  var office2 =  system.addApartment(apartmentNum: 2, apartmentType: ApartmentType.office, price: 850);


  print('before select type');
  print(office1);
  var safa = system.addBuilding(buildingName: 'safa', cityName: 'tadmor', numFloors: 3, elevators: [safaElevator1,safaElevator2], apartments: [office1]);
  print('after select type');
  print(safa.apartments[0]);
  var star = system.addBuilding(buildingName: 'star', cityName: 'nablus', numFloors: 2, elevators: [starElevator1], apartments: <Apartment>[]);
  var quds = system.addBuilding(buildingName: 'quds', cityName: 'nablus', numFloors: 2, apartments: [office2]);


    print('before update starElevator1');
    print(star.toString());
    var updatedStarElevator1 = starElevator1.updateElevator(serviceStatus: ServiceStatus.outOfService);
    system.updateBuildingElevator(building: star, oldElevator:starElevator1, newElevator:updatedStarElevator1 );
    print('after update starElevator1');
    print(star.toString());
    print('\n');


    print('before update office1');
    print(safa.toString());
    var updatedOffice1 = office1.updateApartment(price:987);
    system.updateBuildingApartment(building: safa, oldApartment:office1, newApartment:updatedOffice1 );
    print('after update office1');
    print(safa.toString());
    print('\n');

  print('before update office2');
  print(quds.toString());
  var updatedOffice2 = office2.updateApartment(price:400);
  system.updateBuildingApartment(building: quds, oldApartment:office2, newApartment:updatedOffice2 );
  print('after update office2');
  print(quds.toString());
  print('\n');


    print('buildings before update quds');
    for (Building building in system.buildings) {
      print(building.toString());
    }
    var updatedQuds = quds.updateBuildingInfo(buildingName: 'quds1');
    system.buildings = system.updatedBuildings(oldBuilding: quds, newBuilding: updatedQuds);
    print('is updated building reference to the old one? ${identical(quds, updatedQuds)}');

    print('buildings after update quds');
    for (Building building in system.buildings) {
      print(building.toString());
    }


  print('\nlist all elevators');
  var elevators = system.allElevators();
    for (var elevator in elevators){
      print(elevator);
    }

  print('\nlist all apartments');
  var apartments = system.allApartments();
  for (var apartment in apartments){
    print(apartment);
  }

  print('\nlist all buildings');
  var buildings = system.allBuildings();
  for (var building in buildings){
    print(building);
  }

  print('\nlist all buildings in nablus');
  var buildingsInNablus = system.allBuildingsInNablus();
  for (var building in buildingsInNablus){
    print(building);
  }

  print('\nfirst building in tadmor');
  try{
    var tadmor = system.tadmor(system.buildings);
    print(tadmor);
  }catch(_){
    print('building not found');
  }

  print('\nbuilding with id = 12');
  try{
    var byId = system.findById(12);
    print(byId);
  }catch (_){
    print('building not found');
  }

}






