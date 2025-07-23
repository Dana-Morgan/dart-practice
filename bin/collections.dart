void collection(){
  var foo = const [];
  final bar = const [];
  const baz = [];
  final bad = [];
  //foo.add(3); //runtime error because the list cant modified (const[])
  foo = [1,2,3]; // i can because its var and i can change its value but i cant
  // modify the old value because it was const
  //bar.add(2);//runtime error because the list cant modified (const[])
  //bar = [1,2]; // compile time because the type is final so i cant change it value
  //baz.add(30); // runtime error because it Equivalent to `const []`
  //baz = [1,2]; // compile time
  bad.add(30); // allow
  //bad = [1,2]; // compile time


  //map declaration
  Map<int, int> map1 = {};
  var map2 = <int,int>{5:5};
  var map3 = {};
  print(map3.runtimeType); //Map<dynamic, dynamic>
  //list declaration
  var list1 = <int>[];
  List<int> list2 = [];
  print(list2 == null);

  int? absentValue;
  int? presentValue =3;
  int? presentKey =3;
  var items = [
    1,
    ?absentValue, //as if it doesn't exist
    presentValue,
    absentValue,//null
    5,
  ]; // [1, 3, null, 5]
  print(items);

  var itemsB = {presentKey: ?absentValue }; // {} if one of them null aware ?value
  // will treat entry as if it doesn't exist
  print(itemsB);
  var itemsC = {presentKey: ?absentValue , presentKey: absentValue }; //{3: null}
  print(itemsC);

  var orderDetails = ['Apples', 12, ''];
  var summary = [
    'Product: ${orderDetails[0]}',
    if (orderDetails case [_, int qty, _]) 'Quantity: $qty',
    if (orderDetails case [_, _, ''])
      'Delivery: Not Started'
    else
      'Delivery: In Progress',
  ]; // [Product: Apples, Quantity: 12, Delivery: Not Started]
  print(summary);

  var nestItems = true;
  var ys = [1, 2, 3, 4];
  var items4 = [
    if (nestItems) ...[
      for (var x = 0; x < 3; x++)
        for (var y in ys)
          if (x < y) x + y * 10,
    ],
  ]; // [10, 20, 30, 40, 21, 31, 41, 32, 42]
  print(items4);

}