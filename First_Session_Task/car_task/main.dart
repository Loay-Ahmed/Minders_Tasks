import 'car.dart';
import 'car_rental_system.dart';
import 'customer.dart';
import 'economic_car.dart';
import 'electric_car.dart';
import 'sports_car.dart';

void main() {
  // Create a car rental system
  final carRentalSystem = CarRentalSystem();

  // Create a few cars
  Car car1 = EconomicCar(2019, 1000);
  Car car2 = SportsCar(2020, 1200, 150);
  Car car3 = ElectricCar(2018, 800, 80);

  // Add the cars to the system
  carRentalSystem.addCar(car1);
  carRentalSystem.addCar(car2);
  carRentalSystem.addCar(car3);

  // Create customers
  Customer customer1 = Customer(
    "Mohammad",
    0111122222,
    "mohamad@example.com",
    "Giza",
  );
  Customer customer2 = Customer(
    "Ahmad",
    0111113333,
    "ahmad@example.com",
    "Cairo",
  );
  Customer customer3 = Customer(
    "Mahmoud",
    0111114444,
    "mahmoud@example.com",
    "Qena",
  );

  // Add customers to the system
  carRentalSystem.registerCustomer(customer1);
  carRentalSystem.registerCustomer(customer2);
  carRentalSystem.registerCustomer(customer3);

  // Display available cars
  carRentalSystem.displayAvailableCars();

  // Create bookings
  carRentalSystem.createBooking(
    customer1,
    car2,
    DateTime(2021, 9, 1),
    DateTime(2021, 9, 10),
    300,
  );

  carRentalSystem.createBooking(
    customer2,
    car1,
    DateTime(2021, 9, 5),
    DateTime(2021, 9, 15),
    100,
  );

  carRentalSystem.createBooking(
    customer1,
    car3,
    DateTime(2021, 9, 10),
    DateTime(2021, 9, 20),
    200,
  );

  // Display available cars
  carRentalSystem.displayAvailableCars();

  // Return a car
  carRentalSystem.returnCar(car3);
}
