import 'package:cdt_client/presentation/core/widgets/form_fields/drop_down_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/pages_switch_with_bottom_indication.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/page_config.dart';
import 'package:cdt_client/presentation/cargo_carier_selection_page/cargo_carier_selection_page.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_core/hmi_core_translate.dart';
import 'package:hmi_widgets/hmi_widgets.dart';
///
/// The body of the [CargoCarierSelectionPage] widget.
/// Fields that are needed for further calculations after the initialization page. 
class CargoCarierSelectionBody extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the [CargoCarierSelectionPage] widget.
  /// Fields that are needed for cargo carier calculations after the initialization page. 
  /// 
  /// [_fields] - temporary example of InitialPage content
  CargoCarierSelectionBody({
    super.key,
  })  : _fields = SgocInit(sgocInit);
  //
  @override
  State<CargoCarierSelectionBody> createState() => _CargoCarierSelectionBodyState();
}
//
class _CargoCarierSelectionBodyState extends State<CargoCarierSelectionBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPageValid = false;
  //
  @override
  Widget build(BuildContext context) {
    final uiPadding = const Setting('ui-padding').toDouble;
    final uiPaddingDouble = const Setting('ui-paddingDouble').toDouble;
    return PagesSwitch(
      pages: [
        PageConfig(
          name: 'cargo_carier_selection_body',
          builder: (context) => Form(
            key: _formKey,
            onChanged: _updateFormValidity,
            autovalidateMode: AutovalidateMode.always,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(uiPaddingDouble),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: uiPadding,
                    children: [
                      SizedBox(height: uiPaddingDouble),
                      Text('Cargo carier selection'.loc),
                      DropDownFormFieldWidget(
                        label: 'Hoist type'.loc,
                        value: widget._fields.getOptionsValue('hoist type'),
                        items: widget._fields.getOptions('hoist type'),
                        onChanged: (value) => setState(() {
                          widget._fields.update('hoist type', value);
                        }),
                        validator: Validator(cases: [MinLengthValidationCase(1)]),
                      ),
                      DropDownFormFieldWidget(
                        label: 'Number of wheels'.loc,
                        value: widget._fields.getOptionsValue('number of wheels'),
                        items: widget._fields.getOptions('number of wheels'),
                        onChanged: (value) => setState(() {
                          widget._fields.update('number of wheels', value);
                        }),
                        validator: Validator(cases: [MinLengthValidationCase(1)]),
                      ),
                      DropDownFormFieldWidget(
                        label: 'Headroom type'.loc,
                        value: widget._fields.getOptionsValue('headroom type'),
                        items: widget._fields.getOptions('headroom type'),
                        onChanged: (value) => setState(() {
                          widget._fields.update('headroom type', value);
                        }),
                        validator: Validator(cases: [MinLengthValidationCase(1)]),
                      ),
                      DropDownFormFieldWidget(
                        label: 'Hoist manufacturer'.loc,
                        value: widget._fields.getOptionsValue('hoist manufacturer'),
                        items: widget._fields.getOptions('hoist manufacturer'),
                        onChanged: (value) => setState(() {
                          widget._fields.update('hoist manufacturer', value);
                        }),
                        validator: Validator(cases: [MinLengthValidationCase(1)]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      isPageValid: () => _isPageValid,
      formsSubmission: () => (),
    );
  }
  //
  void _updateFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isPageValid = isValid;
    });
  }
}
//
//
//
//
final Map<String, Object?> sgocInit = {
  'hoist type': {
    'value': "",
    'options': const 
    ['rope type', 
    'chain type', 
    'any '], 
  },
  'number of wheels': {
    'value': "",
    'options': const 
    ['4', 
    '8', 
    'any '], 
  },
  'headroom type': {
    'value': "",
    'options': const 
    ['normal construction height', 
    'reduced construction height', 
    'any '], 
  },
  'hoist manufacturer': {
    'value': "",
    'options': const 
    ['list of hoist manufacturers presented in the database', 
    'any '], 
  }
};
