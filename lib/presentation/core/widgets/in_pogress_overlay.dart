import 'package:flutter/material.dart';

///
/// TODO
class InProgressOverlay extends StatelessWidget {
  final bool isSaving;
  final String message;
  ///
  /// TODO
  const InProgressOverlay({
    super.key,
    required this.isSaving,
    required this.message,
  });
  //
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving 
          ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.8) 
          : Colors.transparent,
        child: Visibility(
          visible: isSaving,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 8.0,),
                Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
