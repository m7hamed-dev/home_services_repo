import 'package:flutter/material.dart';

class RatingCountWidget extends StatelessWidget {
  final int countStar;
  const RatingCountWidget({
    Key? key,
    required this.countStar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          countStar,
          (index) => const Icon(
            Icons.star_rate,
            // Icons.star_half,
            color: Colors.amber,
            size: 26,
          ),
        ),
      ),
    );
  }
}
