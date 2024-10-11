import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // For context use

// Reusable Custom Cupertino Dialog function
void showCustomCupertinoDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String confirmText,
  required String cancelText,
  required VoidCallback onConfirm,
  VoidCallback? onCancel, // Optional cancel action
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: onConfirm, // Action for confirm button
            child: Text(confirmText),
          ),
          CupertinoDialogAction(
            onPressed: onCancel ?? () => Navigator.of(context).pop(), // Action for cancel button (optional)
            child: Text(cancelText),
            isDestructiveAction: true, // Destructive action for cancel
          ),
        ],
      );
    },
  );
}
