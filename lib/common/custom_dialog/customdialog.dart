import 'package:flutter/cupertino.dart';
// For context use

// Reusable Custom Cupertino Dialog function
void showCustomCupertinoDialog({
  required BuildContext context,
  required String title,
  Color? titleColor,
  required String content,
  Color? contentColor,
  required String confirmText,
  Color? confirmTextColor,
  required String cancelText,
  Color? cancelTextColor,
  required VoidCallback onConfirm,
  VoidCallback? onCancel, // Optional cancel action
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title, style: TextStyle(color: titleColor),),
        content: Text(content, style: TextStyle(color: contentColor),),
        actions: [
          CupertinoDialogAction(
            onPressed: onConfirm, // Action for confirm button
            child: Text(confirmText, style: TextStyle(color: confirmTextColor),),
          ),
          CupertinoDialogAction(
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            isDestructiveAction: true, // Action for cancel button (optional)
            child: Text(cancelText, style: TextStyle(color: cancelTextColor),), // Destructive action for cancel
          ),
        ],
      );
    },
  );
}
