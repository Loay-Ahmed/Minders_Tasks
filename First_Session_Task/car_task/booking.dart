import 'car.dart';
import 'customer.dart';

class Booking {
  static int counter = 0;

  final int booking_id;
  final Customer customer;
  final Car car;
  final DateTime start_date;
  final DateTime end_date;
  final Duration rental_duration;
  int total_cost;
  final int penalty;

  Booking(this.customer, this.car, this.start_date, this.end_date, this.penalty)
      : booking_id = counter++,
        rental_duration = end_date.difference(start_date),
        total_cost = 0 {
    total_cost = calculateTotalCost();
  }

  int calculateTotalCost() {
    return car.calculateCost(rental_duration.inDays);
  }

  String displayBookingDetails() {
    return "Booking ID: $booking_id\nCustomer: ${customer.displayCustomerInfo()}\nCar: ${car.displayCarDetails()}\nStart Date: $start_date, End Date: $end_date\nRental Duration: $rental_duration\nTotal Cost: $total_cost, Penalty: $penalty";
  }
}
