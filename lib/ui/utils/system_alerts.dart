import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class SystemAlerts {
  Future<void> showAlertPopUp({
    required BuildContext context,
    required ThemeData theme,
    required String title,
    required String content,
    Color? color,
    String? confirmText,
    String? cancelText,

    required Function() onPressed,
  }) {
    return showAdaptiveDialog(
      context: context,
      barrierColor: theme.colorScheme.primary.withValues(alpha: 0.5),
      barrierDismissible: true,
      builder:
          (_) => AlertDialog.adaptive(
            contentPadding: const EdgeInsets.all(20),
            backgroundColor: theme.colorScheme.surface,
            title: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color ?? theme.colorScheme.error,
              ),
            ),
            content: Text(
              content,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  confirmText ?? "Yes",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color ?? theme.colorScheme.error,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  cancelText ?? "No",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Future<bool> sendNotification({
    required BuildContext context,
    required String title,
    required String body,
    required ThemeData theme,
    String channelKey = 'basic_channel',
    int? id,
  }) async {
    try {
      final isAllowed = await AwesomeNotifications().isNotificationAllowed();

      if (!isAllowed) {
        if (context.mounted) {
          await showAlertPopUp(
            context: context,
            theme: theme,
            title: "Push Notifications",
            content:
                "Please allow push notifications to receive important updates.",
            color: theme.colorScheme.primary,
            confirmText: "Allow",
            cancelText: "Not Now",
            onPressed: () {
              AwesomeNotifications().requestPermissionToSendNotifications();
              Navigator.pop(context);
            },
          );
        }

        return await AwesomeNotifications().isNotificationAllowed();
      } else {
        // Permission already granted, create notification
        if (context.mounted) {
          // Generate a unique ID if not provided
          final notificationId =
              id ?? DateTime.now().millisecondsSinceEpoch % 100000;

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: notificationId,
                channelKey: channelKey,
                actionType: ActionType.Default,
                title: title,
                body: body,
              ),
            );
          });
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Error sending notification: ${e.toString()}');
      return false;
    }
  }

  static Future<bool> _cancelNotificationInIsolate(int id) async {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await AwesomeNotifications().cancel(id);
      });
      return true;
    } catch (e) {
      debugPrint('Error in isolate canceling notification: $e');
      return false;
    }
  }

  Future<bool> cancelNotification(int id) async {
    return await _cancelNotificationInIsolate(id);
  }
}
