import 'package:flutter/material.dart';
import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/initial_page/widgets/page_data_widgets/general_crane_parameters_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/page_data_widgets/overall_dimensions_crane_part_page.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
///
///
class SecondPage extends StatefulWidget {
  final SgocInit _fields;
  final void Function(bool) _onValidationChanged;
  ///
  /// The body of [SecondPage].
  /// 
  /// - [fields] - temporary example of [ResultPage] data.
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
        autovalidateMode: AutovalidateMode.always,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: uiPadding,
          children: [
            SizedBox(width: uiPadding),
            Expanded(
              child: GeneralCraneParametersPartPage(fields: widget._fields),
            ),
            Expanded(
              child: OverallDimensionsCranePartPage(fields: widget._fields),
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