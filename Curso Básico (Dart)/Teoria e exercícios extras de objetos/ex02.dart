class TemperatureConverter {
  double _celsius;

  TemperatureConverter(this._celsius);

  double get celsius => _celsius;

  set celsius(double newCelsius) {
    _celsius = newCelsius;
  }

  double get fahrenheit => (_celsius * 9 / 5) + 32;

  set fahrenheit(double newFahrenheit) {
    _celsius = (newFahrenheit - 32) * 5 / 9;
  }
}
