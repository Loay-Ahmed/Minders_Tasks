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
    this.total_amount = base_rental_cost + additional_fees;
  }

  void generateInvoice() async {
    // creates a file containing the invoice data
    final file = File("Invoice_${invoice_id}.txt");
    await file.writeAsString(displayInvoice());
  }

  String displayInvoice() {
    // returns the data of the invoice
    return "Invoice ${invoice_id}\nCustomer: ${customer.displayCustomerInfo()}\nBooking: ${booking_id}\nCar: ${car.displayCarDetails()}\nBase Rental Cost: ${base_rental_cost}\nAdditional Fees: ${additional_fees}\nTotal Amount: ${total_amount}";
  }
}
