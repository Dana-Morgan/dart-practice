void late(){

  late String note1;

  //print(note1); // it make a compiler error because note1 is a local variable so i cant
  // Initialize it out of his scope so compiler is sure that note1 not initialized before usage

  //print(note2); //but here note2 is a global variable so i can initialize scope so he dont
  // give a compiler error but if i run the app before initialization and i use it ill have runtime error

}
late String note2;
