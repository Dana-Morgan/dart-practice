import './immutable_string.dart';
void funcWithNonNullblePara(String input){
  print(input);
}
void nullSafty() {
  print("test function");
  final String? name = 'dana'; // it can be null
  funcWithNonNullblePara(name!); // as i say i will give you a value later
  // String s;
  // immutableString(name,s); // error because i must assign value before use it, the solution is to assign
  // or make s nullable and give it ! when use it

  print(null.toString()); //can apply at null value
  print(null.hashCode); //can apply at null value
}
