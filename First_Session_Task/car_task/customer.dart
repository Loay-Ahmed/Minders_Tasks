import 'booking.dart';

class Customer {
  static int counter = 0;
  final int customer_id;
  final String name;
  final int phone_number;
  final String email;
  final String address;
  final List<Booking> booking_history;

  Customer(this.name, this.phone_number, this.email,
      this.address, this.booking_history) : customer_id = counter++;
  
  void addBooking() {
    
  }

  String displayCustomerInfo() {
    return "Name: $name, ID: $customer_id\nEmail: $email, Phone number: $phone_number\n Address: $address\nHistory: ${booking_history}";
  }
}
