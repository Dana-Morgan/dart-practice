import './immutable-string.dart';
void funcWithNonNullblePara(String input){
  print(input);
}
void testFunction() {
  print("test function");
  final String? name = 'dana'; // it can be null
  funcWithNonNullblePara(name!); // as i say i will give you a value later
  // String s;
  // immutableString(name,s); // error because i must assign value before use it, the solution is to assign
  // or make s nullable and give it ! when use it
}
