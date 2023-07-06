import 'package:flutter/material.dart';

class TrackerBox extends StatelessWidget {
  const TrackerBox({
    super.key,
    required this.isFilled,
  });
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isFilled ? Colors.black : Colors.transparent,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
