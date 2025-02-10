import 'booking.dart';
import 'car.dart';

class Customer {
  static int counter = 0;
  final int customer_id;
  final String name;
  final int phone_number;
  final String email;
  final String address;
  List<Booking> booking_history = [];

  Customer(
    this.name,
    this.phone_number,
    this.email,
    this.address,
    // this.booking_history,
  ) : customer_id = counter++;

  // Add a booking to the booking history
  Booking addBooking(
    Car car,
    DateTime start_date,
    DateTime end_date,
    int penalty,
  ) {
    booking_history.add(Booking(this, car, start_date, end_date, penalty));
    car.availability = false;
    return booking_history.last;
  }

  // Display booking history
  String displayBookingHistory() {
    String bookings = "";
    for (Booking booking in booking_history) {
      bookings += "book id: " + booking.booking_id.toString() + ", ";
    }
    return "[${bookings.substring(0, bookings.length - 2)}]";
  }

  String displayCustomerInfo() {
    return " Name: $name, ID: $customer_id\n Email: $email, Phone number: $phone_number\n Address: $address\n History: ${displayBookingHistory()}";
  }
}
