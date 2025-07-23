abstract class Animal{ void eat()=> print('eating'); }
mixin Bark{ void bark()=> print('barking'); }
class Dog extends Animal with Bark{}
class Fox extends Animal with Bark{}
class HusskyDog extends Dog{}

void useClasses(){
  HusskyDog dog = HusskyDog();
  Dog hussky = HusskyDog();
  //HusskyDog dog2 = Dog(); cannot assign a superclass object to a subclass variable, because the superclass instance
  // does not necessarily contain all the properties or behaviors of the subclass.
  dog.bark();
  dog.eat();
  hussky.eat();
  hussky.bark();
}