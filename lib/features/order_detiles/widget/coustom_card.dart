import 'package:flutter/material.dart';

import '../../../core/theming/text_styel.dart';

class CoustomCard extends StatelessWidget {
  final String name;
  final String count;
  final String image;
  const CoustomCard(
      {super.key,
      required this.name,
      required this.count,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(image))),
          Expanded(
            flex: 4,
            child: ListTile(
              title: Text(
                name,
                style: TextStyles.font20PrimaryBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
