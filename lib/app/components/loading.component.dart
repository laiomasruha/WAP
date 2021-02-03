import 'package:flutter/material.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';

// ignore: must_be_immutable
class Loading extends StatelessWidget {
  bool isLoading = false;
  final Widget child;

  Loading({
    @required this.isLoading,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            child: Center(
              child: GenericProgressIndicator(false),
            ),
          )
        : child;
  }
}
