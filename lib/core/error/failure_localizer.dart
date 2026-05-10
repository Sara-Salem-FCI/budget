import 'package:flutter/material.dart';
import 'package:budget/l10n/app_localizations.dart';

/// Resolves failure message keys to localized strings.
///
/// If the message is a known localization key (e.g.
/// 'error_connection_timeout'), it returns the localized
/// translation. Otherwise, it returns the message as-is
/// (useful for server-provided messages that are already
/// in the user's language).
class FailureLocalizer {
  static String localize(String message, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    switch (message) {
      case 'error_connection_timeout':
        return l10n.error_connection_timeout;
      case 'error_bad_response':
        return l10n.error_bad_response;
      case 'error_request_cancelled':
        return l10n.error_request_cancelled;
      case 'error_no_internet':
        return l10n.error_no_internet;
      case 'error_unexpected_network':
        return l10n.error_unexpected_network;
      case 'error_unexpected':
        return l10n.error_unexpected;
      default:
        // Server-provided message, return as-is
        return message;
    }
  }
}
