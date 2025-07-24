import './null_safety.dart';
import './immutable_string.dart';
import './course_exercises.dart';
import './collections.dart';
import './record.dart';
import './late.dart';
import './classes.dart';
import './product.dart';
import 'building_exercise/ui/test_building.dart';


void main(List<String> arguments) {

  var x = 1; // dart automatically know that the type is int (type Inference)

  // x = "dana"; // it wont accept this value because there is a type safety in dart

  nullSafty();
  testImmutableString();
  late();
  print(roundToDecimalPlaces(3.17444, 3));
  record();
  collection();

  double a = 1;
  double b = 2;
  print('before swaping a=$a and b=$b');
  (a, b)=swapNumbers(a, b);
  print('after swaping a=$a and b=$b');

  String name = 'dana morgan';
  print('before remove white spaces: $name');
  name = removeSpaces(name);
  print('after remove white spaces: $name');

  int freq = findFrequancy(name, 'a');
  print("number of a’s in $name is $freq");
  int freq2 = findFreq(name, 'a');
  print("number of a’s in $name is $freq2");

  print(computeQuotientAndRemainder(9, 2));

  var numbers = [1,2,4,6,4];
  print(largestNum(numbers));

  print(everOrOdd(3));
  print(everOrOdd(10));
  Map scores = {
    'Alice': 50,
    'Bob': 75,
    'Charlie': 60,
  };
  testClass();

  Map<String, dynamic> productData = {
    'id': '123',
    'name': 'Phone',
    'price': 299.99,
  };

  Product p = Product.fromMap(productData);
  print('Product: ${p.name}, id: ${p.id}, price: ${p.price}');

 testBuilding();
}
