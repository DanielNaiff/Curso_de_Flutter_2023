void main() {
}


Class Circle(){
  double _raio;
  Circle(this _raio);

  double get area{
    return 3.14 * _radius * _radius;
  }

  set radius (double newRadius){
    if (newRadius >= 0){
      -radius = newRadius;
    }
  }
  
}
