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
    Booking booking = Booking(customer, car, start_date, end_date, penalty);
    bookings.add(booking);
    customer.booking_history.add(booking);
  }

  void displayAvailableCars() {
    for (Car car in cars) {
      print(car.displayCarDetails());
    }
  }

  void generateReport() async {
    final file = File("Report.txt");

    for (Booking booking in bookings) {
      if (booking.end_date.isBefore(DateTime.now())) {
        final invoice = Invoice(
            booking.booking_id, booking.customer, booking.car, booking.penalty);
        invoice.generateInvoice();
        await file.writeAsString(invoice.displayInvoice() + "\n",
            mode: FileMode.append);
      }
    }
  }
}
