import 'package:flutter/widgets.dart';
import 'chat_theme.dart';

/// Used to make provided [ChatTheme] class available through the whole package.
class InheritedChatTheme extends InheritedWidget {
  /// Creates [InheritedWidget] from a provided [ChatTheme] class.
  const InheritedChatTheme({
    super.key,
    required this.theme,
    required super.child,
  });

  /// Represents chat theme.
  final ChatTheme theme;

  static InheritedChatTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedChatTheme>()!;

  @override
  bool updateShouldNotify(InheritedChatTheme oldWidget) =>
      theme.hashCode != oldWidget.theme.hashCode;
}
