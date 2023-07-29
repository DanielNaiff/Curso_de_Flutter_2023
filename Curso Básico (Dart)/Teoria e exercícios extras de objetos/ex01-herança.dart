void main(){
  Animal animal1 = Animal('Som desconhecido');
  animal1.emitSound();
  
  Dog dog1 = Dog('AUAu');
  dog1.emitSound();
  
  Cat cat1 = Cat('Miau');
  cat1.emitSound();
  
}
class Animal{
  String som;
  
  Animal(this.som);
  
  void emitSound(){
    print(som);
  }
}

class Dog extends Animal{
  Dog(som): super(som);
  
  @override
   void emitSound(){
    print(som);
 }
}

class Cat extends Animal{
  Cat(som): super(som);
  
  @override
   void emitSound(){
    print(som);
 }
}
