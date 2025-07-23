void record(){

  //({String firstName, String lastName}, int age) details; //if we have named it must be latest just in declaration
  (int age,{String firstName, String lastName}) info;
  info = (firstName: 'dana', lastName: 'morgan', 21);
  print('my name is ${info.firstName} ${info.lastName} and im ${info.$1}');

  var record = ('first', a: 2, b: true, 'last');
  print(record.runtimeType);


  final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};
  var (String name1, int age1) = userInfo(json);
  print(userInfo(json));

// use record structure in flutter will ba as
  final buttons = [
    (
    label: "Button I",
    //icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
    ),
    (
    label: "Button II",
    //icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
    )
  ];
  print(buttons.runtimeType);
  //or wih typedef
  final List<ButtonItem> buttons2 = [];
  print(buttons2.runtimeType);

}
typedef ButtonItem = ({
String label,
String iconName,
void Function()? onPressed,
});


(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] , json['age'] );
}