import 'apartment_type.dart';
import './owner.dart';

class Apartment{
  final ApartmentType apartmentType;
  final int apartmentNum;
  final int price;
  final Owner? owner;
  Apartment({required this.apartmentNum, required this.apartmentType, required this.price, this.owner});

  Apartment updateApartment({ApartmentType? apartmentType, int? num, int? price}){
    return Apartment(apartmentNum: num ?? this.apartmentNum,
        apartmentType: apartmentType?? this.apartmentType,
        price: price?? this.price, owner: owner?? owner);
  }

  @override
  String toString() {
    String apartment;
    if(apartmentType == ApartmentType.office){
      apartment = 'office';
    }else{
      apartment= 'apartment';
    }
    if (owner==null){
    return 'apartment $apartmentNum is a $apartment and its price $price dollar';
  }else{
    return 'apartment $apartmentNum is a $apartment and its price $price dollar for owner $owner';
    }
    }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Apartment && runtimeType == other.runtimeType && apartmentNum == other.apartmentNum;

}