import 'dart:io';

import 'car.dart';
import 'customer.dart';

class Invoice {
  static int counter = 0;

  final int invoice_id;
  final int booking_id;
  final Customer customer;
  final Car car;
  int base_rental_cost;
  final int additional_fees;
  int total_amount;

  Invoice(this.booking_id, this.customer, this.car, this.additional_fees)
      : invoice_id = counter++,
        base_rental_cost = 0,
        total_amount = 0 {
    this.base_rental_cost = car.rental_price_per_day;
    final booking = customer.booking_history
        .where((element) => element.booking_id == booking_id)
        .toList()[0];
    final rental_duration = booking.rental_duration.inDays;
    this.total_amount = (base_rental_cost * rental_duration) + additional_fees;
  }

  Future<void> generateInvoice() async {
    // creates a file containing the invoice data
    final file = File("Invoice_${invoice_id}.txt");
    try {
      await file.writeAsString(displayInvoice());
    } catch (Exception) {
      print("Error writing to file");
    }
  }

  String displayInvoice() {
    // returns the data of the invoice
    return "Invoice ${invoice_id}${Platform.lineTerminator}Customer:${Platform.lineTerminator}${customer.displayCustomerInfo()}${Platform.lineTerminator}Booking: ${booking_id}${Platform.lineTerminator}Car:${Platform.lineTerminator}${car.displayCarDetails()}${Platform.lineTerminator}Base Rental Cost: ${base_rental_cost}${Platform.lineTerminator}Additional Fees: ${additional_fees}${Platform.lineTerminator}Total Amount: ${total_amount}";
  }
}
