import 'booking.dart';
import 'car.dart';
import 'customer.dart';
import 'dart:io';

import 'invoice.dart';

class CarRentalSystem {
  List<Car> cars = [];
  List<Customer> customers = [];
  List<Booking> bookings = [];

  void addCar(Car car) {
    cars.add(car);
  }

  void registerCustomer(Customer customer) {
    customers.add(customer);
  }

  void createBooking(Customer customer, Car car, DateTime start_date,
      DateTime end_date, int penalty) {
    customer.addBooking(car, start_date, end_date, penalty);
    generateReport(customer, car);
  }

  void displayAvailableCars() {
    for (Car car in cars) {
      print(car.displayCarDetails());
    }
  }

  void generateReport(Customer customer, Car car) async {
    final file = File("Report.txt");
    String reportData = "User ${customer.name} has booked car ${car.car_id}\n";
    await file.writeAsString(reportData);
  }

  void returnCar(Car car) {
    final bookedCar = bookings.where((book) => book.car == car).toList()[0];
    final invoice = Invoice(
        bookedCar.booking_id, bookedCar.customer, car, car.additional_fees);
    bookedCar.customer.booking_history.remove(bookedCar);
    invoice.generateInvoice();
    car.availability = true;
  }
}
