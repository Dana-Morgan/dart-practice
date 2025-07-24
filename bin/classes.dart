import 'dart:math';

class Class1 {

  final int x, y;
  //int z = this.x;  compile-time error, can't access `this` in non-`late` initializer:
  //late int z = this.x;

   const Class1(this.x, this.y); //parameterize constructor
   Class1.middle(): this(0, 0); // named constructor
  const Class1.constructor(this.x, this.y);

  //Static methods (class methods) don't operate on an instance
  static double distanceBetween(Class1 a, Class1 b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    // var n = this.x; static methods in classes don't have access to this
    return sqrt(dx * dx + dy * dy);
  }

  //non-static class method can access this
   double distance(Class1 a, Class1 b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    var n = this.x;
    return sqrt(dx * dx + dy * dy);
  }
}
class MyClass {
  final int x;
  final String y;
  final int? z;

  // 1. Default constructor with named parameters (required + default)
  const MyClass({
    required this.x,
    required this.y,
    this.z = 0, // default value
  });

  // 2. Named constructor with positional parameters (all required)
  const MyClass.named(this.x, this.y, this.z);

  // 3. Named constructor redirecting to the default constructor
  const MyClass.named0(int x) : this(x: x, y: 'string');

  // 4. Named constructor with named parameters (some required, some default)
  const MyClass.named1({
    required this.x,
    required this.y,
    this.z = 10,
  });

  // 5. Named constructor with optional positional parameters and default values
  const MyClass.named2([this.x = 0, this.y = 'default', this.z = 5]);

  MyClass copyWith({
    int? x,
    String? y,
    int? z,
  }) {
    return MyClass(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
    );
  }
}
void testClass() {
  Class1? p1 = Class1(3, 4);
  Class1? p2 = null;
  //p1.distanceBetween(a, b)   //Static methods (class methods) don't operate on an instance
  //Class1.distanceBetween(p1, p2!); // we can access static methods fromm class itself not instance
// since i make p1 and p2 nullable (initial value will be null) i must use p1?.parameter to avoid exceptions error
// so it will make values of parameters null if there isnt value initialize
  var a = p1?.y; // a = 4
  var b = p2?.y; // b = null
  // Lots of const keywords here.

  print(a); // 4
  print(b); // null
  var obj1 = new MyClass.named(1, '2', 3);
  MyClass obj2 = new MyClass(x:1,y:'2');
  MyClass obj3 = MyClass.named0(5);
  print(obj3.x);print(obj3.y);print(obj3.z);
  MyClass obj4 = obj3.copyWith(x:1);
  print(obj4.x);print(obj4.y);print(obj4.z);
}




