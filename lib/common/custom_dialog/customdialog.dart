import 'package:flutter/material.dart';

// Reusable Custom Dialog function
void showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String confirmText,
  required String cancelText,
  required VoidCallback onConfirm,
  VoidCallback? onCancel, // Optional cancel action
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: onConfirm, // Action for confirm button
            child: Text(confirmText),
          ),
          TextButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(), // Action for cancel button (optional)
            child: Text(cancelText),
          ),
        ],
      );
    },
  );
}
