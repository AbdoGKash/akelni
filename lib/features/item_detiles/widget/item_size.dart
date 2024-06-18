// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';

import '../model/size_model.dart';

class PizzaSizeSelector extends StatefulWidget {
  const PizzaSizeSelector({super.key});

  @override
  _PizzaSizeSelectorState createState() => _PizzaSizeSelectorState();
}

class _PizzaSizeSelectorState extends State<PizzaSizeSelector> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: sizes.map((size) {
        return Row(
          children: [
            Radio<String>(
              value: size,
              groupValue: _selectedSize,
              activeColor: ColorsManager.primary,
              onChanged: (String? value) {
                setState(() {
                  _selectedSize = value;
                });
              },
            ),
            Text(size),
          ],
        );
      }).toList(),
    );
  }
}
