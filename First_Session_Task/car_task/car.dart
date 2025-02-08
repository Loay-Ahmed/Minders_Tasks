abstract class Car {
  int get car_id;
  set car_id(int id);

  int get year;
  set year(int year);

  int get rental_price_per_day;
  set rental_price_per_day(int price);

  bool get availability;
  set availability(bool availability);

  String displayCarDetails();
  int calculateCost(int days);
}
