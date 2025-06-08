import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/general_crane_parameters_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/overall_dimensions_crane_part_page.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_app_settings.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/hoist_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/trolley_running_mechanism_part_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/bridge_running_mechanism_part_page.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md).
/// Access to edit may be restricted depends on user priveleges.
class InitialBody extends StatefulWidget {
  final Pages form;
  // final Map<Pages, Map> pageData;
  final AppUserStacked users;
  final SgocInit fields;
  final Function(bool isValid)? onValidationChanged;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [form] - current form
  /// [fields] - temprorary example of InitialPage content
  /// [pageData] - content of all forms
  /// [users] - all stored users
  /// [onValidationChanged] - callback for checking is form valid
  InitialBody({
    super.key,
    required this.form,
    //required this.pageData,
    required this.users,
    required this.onValidationChanged,
  }):
    fields = SgocInit(sgocInit);
  //
  @override
  State<InitialBody> createState() => _InitialBodyState();
}
//
class _InitialBodyState extends State<InitialBody> {
  final _formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisSize:MainAxisSize.max,
                children: [
                  Container(
                    constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 2),
                    child: Padding(
                      padding: EdgeInsets.all(Setting('ui-padding').toDouble),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HoistPartPage(fields: widget.fields, formValidator: _formValidator),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 2),
                    child: Padding(
                      padding: EdgeInsets.all(Setting('ui-padding').toDouble),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TrolleyRunningMechanismPartPage(fields: widget.fields, formValidator: _formValidator),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Setting('ui-paddingDouble').toDouble),
            Container(
              constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisSize:MainAxisSize.max,
                children: [
                  Container(
                    constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width/2),
                    child: Padding(
                      padding: EdgeInsets.all(Setting('ui-padding').toDouble),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BridgeRunningMechanismPartPage(fields: widget.fields, formValidator: _formValidator),                 
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width/2),
                    child: Padding(
                      padding: EdgeInsets.all(Setting('ui-padding').toDouble),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GeneralCraneParametersPartPage(fields: widget.fields, formValidator: _formValidator),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints:BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width / 2),
              child: Padding(
                padding: EdgeInsets.all(Setting('ui-padding').toDouble),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      OverallDimensionsCranePartPage(fields: widget.fields, formValidator: _formValidator),
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  ///
  /// Check if all fields in form are not empty
  /// and notificate [PagesSwitch].
  void _formValidator(String? validationResult) {
    final isValid = (_formKey.currentState?.validate() ?? false) && (validationResult == null || validationResult.isEmpty);
    widget.onValidationChanged?.call(isValid);
  }
}
// ElevatedButton(
              //   onPressed: _validateForm,
              //   child: const Text('Сохранить'),
              // ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width * 0.25,
              //   child: InputDecorator(
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Name of the field',
              //           style: Theme.of(context).textTheme.bodyLarge,
              //         ),
              //         Checkbox(
              //           value: _checkboxValue,
              //           onChanged: (value) {
              //             setState(() {
              //               _checkboxValue = value ?? false;
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

final sgocInit = {
  // Hoist parameters
  'load': '5.0', // load
  'lifting-height': '6.0', // lifting height
  'lifting-device': { // lifting device
    'value': "hook block",
    'options': const ['hook block', 'electro-hydraulic grab', 'electromagnet'], // lifting device options
  },
  'rated-travelling-hoist-speed': '8.0', // rated travelling hoist speed
  'slow-travelling-hoist-speed': '1.5', // slow travelling hoist speed
  'hoist-group': {   // hoist group
    'value': "M5",
    'options': List.generate(8, (index) => 'M${index + 1}'), // hoist group options
  },
  'lifting-duration': {  // lifting duration
    'value': "40%",
    'options': const ['15%', '25%', '40%', '60%', '100%'], // lifting duration options
  },
  'hoist-control-system': {  // hoist control system
    'value': "Variable Frequency Drive (VFD)",
    'options': const [ // hoist control system options
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
  },
  'lifting-mechanism-drive-type': {   // lifting mechanism drive type
    'value': "HD3",
    'options': const ['HD1', 'HD2', 'HD3', 'HD4', 'HD5'], // lifting mechanism drive type options
  },
  'type-of-lifted-load': {   // type of lifted load
    'value': "safe",
    'options': const ['safe', 'dangerous'], // type of lifted load options
  },
  // Trolley running mechanism
  'rated-travelling-trolley-speed': '20.0',
  'slow-travelling-trolley-speed': '5.0',
  'trolley-group': {
    'value': 'M4',
    'options': List.generate(8, (index) => 'M${index + 1}'),
  },
  'trolley-control-system': {
    'value': 'Variable Frequency Drive (VFD)',
    'options': [
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
  },
  'trolley-power-system': {
    'value': 'conductor bar',
    'options': ['festoon system', 'energy chain', 'conductor bar'],
  },

  // Bridge running mechanism
  'rated-travelling-bridge-speed': '32.0',
  'slow-travelling-bridge-speed': '8.0',
  'crane-drive-group': {
    'value': 'M4',
    'options': List.generate(8, (index) => 'M${index + 1}'),
  },
  'bridge-movement-duration': {
    'value': '40%',
    'options': ['15%', '25%', '40%', '60%', '100%'],
  },
  'bridge-control-system': {
    'value': 'Variable Frequency Drive (VFD)',
    'options': [
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
  },
  'crane-power-system': {
    'value': 'conductor bar',
    'options': ['festoon system', 'cable reel', 'energy chain', 'conductor bar'],
  },
  'bridge-drive-type-system': {
    'value': 'gearmotor',
    'options': ['detailed bridge drive', 'gearmotor'],
  },
  'bridge-drive-diagram': {
    'value': 'separate drive',
    'options': ['central drive', 'separate drive'],
  },
  'bridge-control-system-of-synchronous-movement': {
    'value': 'present',
    'options': ['present', 'absent'],
  },
  'type-crane-rail': '',
  'crane-rail-length': '50.0',

  // General crane parameters
  'crane-purpose': {
    'value': 'industrial purpose',
    'options': ['industrial purpose', 'metallurgical purpose', 'special purpose', 'marine purpose'],
  },
  'explosion-fire-safe-crane-purpose': {
    'value': 'industrial purpose',
    'options': ['industrial purpose', 'fire-safe purpose', 'explosion-safe purpose'],
  },
  'marking-of-fire-explosion-hazardous-operating-environment': '',
  'duty-class': {
    'value': 'A5',
    'options': List.generate(12, (index) => 'A$index'),
  },
  'climatic-design-and-placement-category-crane': {
    'value': 'У3',
    'options': [
      'У1', 'У2', 'У3', 'У5', 'ХЛ1', 'ХЛ2', 'ХЛ3', 'УХЛ4', 'УХЛ4.1', 'УХЛ4.2',
      'О4', 'О4.1', 'О4.2', 'Т5', 'ТС2', 'В3', 'В3.1', 'В4.1', 'ОМ.4', 'В5'
    ],
  },
  'crane-wind-area': {
    'value': 'II',
    'options': ['0', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'морской'],
  },
  'max-use-temperature': '40',
  'min-use-temperature': '-20',
  'basic-crane-control': {
    'value': 'pendant control',
    'options': ['crane cab', 'pendant control', 'remote control', 'cab/remote control'],
  },
  'cab-location': {
    'value': 'bridge edge',
    'options': ['bridge edge', 'bridge span center', 'crane trolley', 'None value'],
  },
  'identical-hoists-volume': '1',
  'max-crane-mass': '8.5',
  'max-wheel-load': '45.0',

  // Crane dimensions
  'span': '10.5',
  'left-edge-approach-lifting-device': '0.3',
  'right-edge-approach-lifting-device': '0.3',
  'vertical-distance-from-crane-rail-to-lifting-device': '0.5',
  'maximum-vertical-distance-from-the-crane-rail-to-the-top-of-the-crane': '1.8',
  'max-crane-base': '4.2',
  'max-width-crane': '2.1'
};