void functions(){
  var sum1 = (int a, int b) { a + b; }; print(sum1(2, 3)); //will return null because {} must have (return) and it dosnt return anything explicitly
  var sum2 = (var a, var b) => a + b; print(sum2(2, 3));
  // int sum = (int a, int b) => a + b; print(sum(2, 3)); A value of type 'int Function(int, int)' can't be assigned to a variable of type 'int'.
}

void createProfile({required String name, required int age}) {} //define required named parameter
