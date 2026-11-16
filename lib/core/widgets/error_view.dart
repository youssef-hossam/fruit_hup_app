import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/widgets/empty_state.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.wifi_off_rounded,
      title: message,
      action: TextButton(onPressed: onRetry, child: Text(S.of(context).tryAgain)),
    );
  }
}
