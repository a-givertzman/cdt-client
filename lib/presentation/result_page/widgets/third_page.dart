import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/crane_metal_structure_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/crane_power_supply_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/hoist_power_supply_page_data.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
///
/// Part of a [ResultPage].
/// The body of [ThirdPage].
class ThirdPage extends StatefulWidget {
  final SgocInit _fields;
  final void Function(bool) _onValidationChanged;
  /// 
  /// Part of a [ResultPage].
  /// The body of [ThirdPage].
  /// 
  /// - [fields] - temporary data of [ResultPage].
  /// - [onValidationChanged] - callback for validation management.
  const ThirdPage({
    super.key, 
    required SgocInit fields,
    required void Function(bool) onValidationChanged,
  })  : _onValidationChanged = onValidationChanged, 
        _fields = fields;
  //
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}
//
class _ThirdPageState extends State<ThirdPage> {
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
              child: CraneMetalStructurePage(fields: widget._fields),
            ),
            Expanded(
              child: HoistPowerSupplyPage(fields: widget._fields),
            ),
            Expanded(
              child: CranePowerSupplyPage(fields: widget._fields),
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