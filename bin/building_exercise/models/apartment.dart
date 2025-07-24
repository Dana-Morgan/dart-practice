import 'apartment_type.dart';

class Apartment{
  final ApartmentType apartmentType;
  final int num;
  final int price;
  Apartment({required this.num, required this.apartmentType, required this.price});

  Apartment updateApartment({ApartmentType? apartmentType, int? num, int? price}){
    return Apartment(num: num ?? this.num,
        apartmentType: apartmentType?? this.apartmentType,
        price: price?? this.price);
  }

  @override
  String toString() {
    String apartment;
    if(this.apartmentType == ApartmentType.office){
      apartment = 'office';
    }else{
      apartment= 'apartment';
    }
    return 'apartment ${this.num} is a ${apartment} ${this.price} dollar';
  }
}