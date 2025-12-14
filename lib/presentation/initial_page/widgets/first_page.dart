import 'package:flutter/material.dart';
import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:cdt_client/presentation/initial_page/widgets/page_data_widgets/hoist_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/page_data_widgets/trolley_running_mechanism_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/page_data_widgets/bridge_running_mechanism_part_page.dart';
///
/// Part of [InitialPage].
/// The body of [FirstPage].
class FirstPage extends StatefulWidget {
  final SgocInit _fields;
  final void Function(bool) _onValidationChanged;
  ///
  /// Part of [InitialPage].
  /// The body of [FirstPage].
  /// 
  /// - [fields] - temporary example of [ResultPage] data.
  /// - [onValidationChanged] - callback for validation management.
  const FirstPage({
    super.key, 
    required SgocInit fields,
    required void Function(bool) onValidationChanged,
  })  : _onValidationChanged = onValidationChanged, 
        _fields = fields;
  //
  @override
  State<FirstPage> createState() => _FirstPageState();
}
//
class _FirstPageState extends State<FirstPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    //
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        onChanged: _updateFormValidity,
        autovalidateMode: AutovalidateMode.always,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: uiPadding,
          children: [
            SizedBox(width: uiPadding),
            Expanded(
              child: HoistPartPage(fields: widget._fields),
            ),
            Expanded(
              child: TrolleyRunningMechanismPartPage(fields: widget._fields),
            ),
            Expanded(
              child: BridgeRunningMechanismPartPage(fields: widget._fields),
            ),
            SizedBox(width: uiPadding),
          ],
        ),
      ),
    );
  }
  //
  void _updateFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    widget._onValidationChanged(isValid);
  }
}
