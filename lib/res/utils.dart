import 'package:flutter/material.dart';

class AppUtils {
  static String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return word; // Return the word as is if it's empty
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }

  static showError(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          txt,
          style: const TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Colors.redAccent, // Background color
        behavior:
            SnackBarBehavior.floating, // Optional: make the SnackBar float
      ),
    );
  }
}
