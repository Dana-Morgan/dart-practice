//Write a  program to add two Integers
import 'dart:math';

int addTwoIntegers(int a , int b) => a+b;

//Write a  program to Multiply two floating point numbers
double multiplyTwoDoubles(double a, double b) => a*b; // in dart we dont have float but we have double

//Write a  code to compute Quotient and Remainder
(int , double)computeQuotientAndRemainder(double dividend, double divisor){
  int quotient = dividend ~/ divisor;
  double remainder = dividend % divisor;
  return (quotient,remainder);
}


//Write a  code to swap two numbers
(double,double) swapNumbers(double a , double b) {
  double temp = a;
  a = b;
  b = temp;
  return (a,b);
}
//or by record
(int, int) swap((int a, int b) record) {
  int a = record.$1;
  int b = record.$2;
  return (b, a);
}

//Write a  code to remove all whitespaces from a string
String removeSpaces(String input) => input.replaceAll(' ', '');

// Write a  code to find the frequency of Character in a string
int findFrequancy(String input , String latter){
  int count = 0;
  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if(latter==char) count++;
  }
  return count;
}
//or
int findFreq(String input , String latter){
  int count = 0;
  for(var char in input.split('')) {
    if(latter==char) count++;
  }
  return count;
}

//Write a code to round a number to n decimal places
double roundToDecimalPlaces(double value, int places) {
  double multiplier = pow(10.0, places).toDouble();
  double shifted = value * multiplier;
  double fractionalPart = shifted - shifted.floor();

  int resultInt;
  if (fractionalPart >= 0.5) {
    resultInt = shifted.ceil();
  } else {
    resultInt = shifted.floor();
  }
  return resultInt/multiplier;
}
/** or by using round()
   double roundToDecimalPlaces(double value, int places) {
     double mod = pow(10.0, places).toDouble();
     return (value * mod).round() / mod;
// } **/
/** another idea (MORE COMPLEX) to convert number into string toStringAsFixed(places+1) then split the string after .
then check the length of fractional part if <= places intPart+fractionalPart and convert them into double .parse()
else check the last index in fractional part (places+1) fractionalPart[places]<=5 if yes
convert into double then remove last number (think about it)
else convert into double, remove last number (think a bout it) and increase last num by 1 (think about it) **/

//Write a  code to check whether a number is even or odd
String everOrOdd(int num){
  if (num%2 == 0){ return '$num is even';
  } else{
    return '$num is odd';
  }
}

//Write a  code to find the largest among a list of numbers
int largestNum(List<int> numbers){
  int largest = numbers[0];
  for(int i =1; i<numbers.length; i++){
    if (largest < numbers[i]) largest = numbers[i];
  }
  return largest;
}

//Write a  code that checks if the Given year is a Leap year or not.
bool isLeap(int year){
  return (year%4 == 0);
}