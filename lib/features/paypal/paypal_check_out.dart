import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaypalCheckout(
      sandboxMode: true,
      clientId:
          "AevwpbqkA6FCCwfYISqtqaj2P-lRG0RZUxXgRdi9r2Yg8tkKalpPDfaVe_ALzojFJVl0jbcJriYLRvYE",
      secretKey:
          "EL4oab11A9k1OA3VtCo2XOCSLTHDmq9neQemJpe9i4jjfcV8loxfEZc32cihFgVRJfNDoJ5sgyFcGH54",
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
