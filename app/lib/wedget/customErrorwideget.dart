import 'package:flutter/material.dart';

class Customerrorwideget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry; // Add this line

  const Customerrorwideget({
    super.key,
    required this.errorMessage,
    this.onRetry, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        if (onRetry != null) // Add this conditional
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
      ],
    );
  }
}
