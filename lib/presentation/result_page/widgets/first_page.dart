import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/general_crane_parameters_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/hoist_page_data.dart';
import 'package:cdt_client/presentation/result_page/widgets/page_data_widgets/trolley_running_mechanism_part_page.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
///
/// Part of a [ResultPage].
class FirstPage extends StatefulWidget {
  final SgocInit _fields;
  final void Function(bool) _onValidationChanged;
  ///
  /// The body of [FirstPage].
  /// 
  /// - [fields] - temporary data of [ResultPage].
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: uiPadding,
          children: [
            SizedBox(width: uiPadding),
            Expanded(
              child: GeneralCraneParametersPage(fields: widget._fields),
            ),
            Expanded(
              child: HoistMechanismPage(fields: widget._fields),
            ),
            Expanded(
              child: TrolleyRunningMechanismPage(fields: widget._fields),
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