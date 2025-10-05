import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/bridge_running_mechanism_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/power_equipment_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/safety_device_page_data.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
///
/// Part of a [ResultPage].
class SecondPage extends StatefulWidget {
  final SgocInit _fields;
  final void Function(bool) _onValidationChanged;
  ///
  /// The body of [SecondPage].
  /// 
  /// - [fields] - temporary data of [ResultPage].
  /// - [onValidationChanged] - callback for validation management.
  const SecondPage({
    super.key, 
    required SgocInit fields,
    required void Function(bool) onValidationChanged,
  })  : _onValidationChanged = onValidationChanged, 
        _fields = fields;
  //
  @override
  State<SecondPage> createState() => _SecondPageState();
}
//
class _SecondPageState extends State<SecondPage> {
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: uiPadding,
          children: [
            SizedBox(width: uiPadding),
            Expanded(
              child: BridgeRunningMechanismPage(fields: widget._fields),
            ),
            Expanded(
              child: SafetyDevicesPage(fields: widget._fields),
            ),
            Expanded(
              child: PowerEquipmentPage(fields: widget._fields),
            ),
            SizedBox(height: uiPadding),
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