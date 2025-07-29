import 'service_status.dart';

class Elevator{
  final int id;
  final int capacity;
  final ServiceStatus serviceStatus;
  final List<int> floors;

  Elevator({required this.id, this.capacity =  10, required this.serviceStatus, required this.floors});

  Elevator updateElevator({int? capacity, ServiceStatus? serviceStatus, List<int>? floors}){
    return Elevator(id: id,
        capacity: capacity ?? this.capacity,
        serviceStatus : serviceStatus ?? this.serviceStatus,
        floors: floors ?? this.floors);
  }
  @override
  String toString() {
    String service;
    if(this.serviceStatus == ServiceStatus.inService) {
      service = 'in Service';
    }else {
      service = 'out Of Service';
    }
    return 'elevator with id: $id with $capacity which service $floors floors is $service ';
  }

}