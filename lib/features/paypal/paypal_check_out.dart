import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

///////////////////// For Testing ////////////////////
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaypalCheckout(
      sandboxMode: true,
      clientId: "XXXXXXXXXXXXXXXXX",
      secretKey: "XXXXXXXXXXXXXXXXX",
      returnURL: "success.snippetcoder.com",
      cancelURL: "cancel.snippetcoder.com",
      transactions: const [
        {
          "amount": {
            "total": '65',
            "currency": "USD",
            "details": {
              "subtotal": '65',
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          ///////////////////// Testing ///////////////////
          "description": "The payment transaction description.",
          "item_list": {
            "items": [
              {
                "name": "Margereta",
                "quantity": 1,
                "price": '65',
                "currency": "USD"
              },
            ],
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        const Center(
          child: Text("Done"),
        );
      },
      onError: (error) {
        Navigator.pop(context);
      },
      onCancel: () {},
    );
  }
}
