// Wiget by Yadu(https://stackoverflow.com/users/12341099/yadu)
// https://stackoverflow.com/questions/49307677/how-to-get-height-of-a-widget

/// Flutter
import "package:flutter/material.dart";

/// Widget that makes a function to access the size of its child.
class SizeProviderWidget extends StatefulWidget {
  /// Constructor
  const SizeProviderWidget({
    required this.onChildSize,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// Child to get its size
  final Widget child;

  /// Function to access the size.
  final Function(Size) onChildSize;

  @override
  SizeProviderWidgetState createState() => SizeProviderWidgetState();
}

/// Stateful part of the widget.
class SizeProviderWidgetState extends State<SizeProviderWidget> {
  @override
  void initState() {
    ///add size listener for first build
    _onResize();
    super.initState();
  }

  void _onResize() {
    WidgetsBinding.instance?.addPostFrameCallback((Duration duration) {
      if (context.size is Size) {
        widget.onChildSize(context.size!);
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
