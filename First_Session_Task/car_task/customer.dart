import 'booking.dart';
import 'car.dart';

class Customer {
  static int counter = 0;
  final int customer_id;
  final String name;
  final int phone_number;
  final String email;
  final String address;
  final List<Booking> booking_history;

  Customer(
    this.name,
    this.phone_number,
    this.email,
    this.address,
    this.booking_history,
  ) : customer_id = counter++;

  // Add a booking to the booking history
  void addBooking(
    Car car,
    DateTime start_date,
    DateTime end_date,
    int penalty,
  ) {
    booking_history.add(Booking(this, car, start_date, end_date, penalty));
    car.availability = false;
  }

  String displayCustomerInfo() {
    return "Name: $name, ID: $customer_id\nEmail: $email, Phone number: $phone_number\n Address: $address\nHistory: ${booking_history}";
  }
}
