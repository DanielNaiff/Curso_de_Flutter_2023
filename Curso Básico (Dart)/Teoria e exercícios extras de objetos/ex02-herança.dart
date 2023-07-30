void main(){
  Square square1 = Square(4,6);
  square1.area();
  
  
}

class Shape{
  double base1;
  double base2;
  
  Shape(this.base1,this.base2);
  
  void area(){
    print(base1*base2);
  }
}

class Square extends Shape{
  
  Square(base1,base2): super (base1, base2);
  
  @override
  void area(){
    print(base1*base2);
  }
}
