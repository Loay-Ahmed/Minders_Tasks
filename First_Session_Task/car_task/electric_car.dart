import 'car.dart';

class ElectricCar implements Car {
  static int counter = 0;
  //Constructor
  ElectricCar(this._year, this._rental_price_per_day, this.charging_capacity,
      this._availability)
      : _car_id = ++counter;

  //Fields
  int _car_id;
  int _year;
  int _rental_price_per_day;
  bool _availability;
  int charging_capacity;

  //Overrides
  @override
  int get car_id => _car_id; //Getter
  set car_id(int id) => _car_id = car_id; //Setter

  @override
  int get year => _year; //Getter
  set year(int year) => _year = year; //Setter

  @override
  int get rental_price_per_day => _rental_price_per_day; //Getter
  set rental_price_per_day(int price) =>
      _rental_price_per_day = _rental_price_per_day; //Setter

  @override
  bool get availability => _availability; //Getter
  set availability(bool availability) => _availability = availability; //Setter

  @override
  String displayCarDetails() {
    return "Car ID: $car_id, Year: $year\nRental Price Per Day: $rental_price_per_day,Charging capacity: $charging_capacity,\nAvailability: $availability";
  }

  @override
  int calculateCost(int days) {
    return rental_price_per_day * days;
  }
}
