void immutableString(String a, String b){
  if (identical(a,b)){
    print("$a and $b refer to the same object");
  } else {
    print("$a and $b dosnt refer to the same object");
  }
}

void testStrings() {
  String a = "dana";
  String aa = a;
  String b = "morgan";
  immutableString(a, aa);
  a = a + b;
  immutableString(a, aa);
}