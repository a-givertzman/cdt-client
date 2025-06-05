import 'package:cdt_client/infrostructure/bc/sgoc_init.dart';
// import 'package:cdt_client/presentation/initial_page/widgets/initial_body/general_crane_parameters_part_page.dart';
// import 'package:cdt_client/presentation/initial_page/widgets/initial_body/overall_dimensions_crane_part_page.dart';
import 'package:flutter/material.dart';
import 'package:hmi_networking/hmi_networking.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/form_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/initial_body/hoist_part_page.dart';
// import 'package:cdt_client/presentation/initial_page/widgets/initial_body/trolley_running_mechanism_part_page.dart';
// import 'package:cdt_client/presentation/initial_page/widgets/initial_body/bridge_running_mechanism_part_page.dart';
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
  const InitialBody({
    super.key,
    required this.form,
    //required this.pageData,
    required this.users,
    required this.onValidationChanged,
  }):
    fields = const SgocInit({});
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
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HoistPartPage(fields: widget.fields, formValidator: _formValidator),
              // TrolleyRunningMechanismPartPage(data: widget.fields, formValidator: _formValidator),
              // BridgeRunningMechanismPartPage(data: widget.fields, formValidator: _formValidator),
              // GeneralCraneParametersPartPage(data: widget.fields, formValidator: _formValidator),
              // OverallDimensionsCranePartPage(data: widget.fields, formValidator: _formValidator),
            ],
          ),
        ),
      ),
    );
  }
  ///
  /// Check if all fields in form are not empty
  /// and notificate [PagesSwitch].
  void _formValidator() {
    final isValid = _validate();
    widget.onValidationChanged?.call(isValid);
  }
  ///
  /// Check if all fields in form are not empty
  bool _validate() {
    return _formKey.currentState?.validate() ?? false;
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
  'rated travelling trolley speed': 20.0, // rated travelling trolley speed
  'slow travelling trolley speed': 5.0, // slow travelling trolley speed
  'trolley group': "M4", // trolley group
  'trolley group options': List.generate(8, (index) => 'M${index + 1}'), // trolley group options
  'trolley control system': "Variable Frequency Drive (VFD)", // trolley control system
  'trolley control system options': const [ // trolley control system options
    'Variable Frequency Drive (VFD)',
    'Relay-Contactor Control System',
    'Thyristor-Choke Control System',
  ],
  'trolley power system': "conductor bar", // trolley power system
  'trolley power system options': const ['festoon system', 'energy chain', 'conductor bar'], // trolley power system options
  // Bridge running mechanism
  'rated travelling bridge speed': 32.0, // rated travelling bridge speed
  'slow travelling bridge speed': 8.0, // slow travelling bridge speed
  'crane drive group': "M4", // crane drive group
  'crane drive group options': List.generate(8, (index) => 'M${index + 1}'), // crane drive group options
  'bridge movement duration': "40%", // bridge movement duration
  'bridge movement duration options': const ['15%', '25%', '40%', '60%', '100%'], // bridge movement duration options
  'bridge control system': "Variable Frequency Drive (VFD)", // bridge control system
  'bridge control system options': const [ // bridge control system options
    'Variable Frequency Drive (VFD)',
    'Relay-Contactor Control System',
    'Thyristor-Choke Control System',
  ],
  'crane power system': "conductor bar", // crane power system
  'crane power system options': const ['festoon system', 'cable reel', 'energy chain', 'conductor bar'], // crane power system options
  'bridge drive type system': "gearmotor", // bridge drive type system
  'bridge drive type system options': const ['detailed bridge drive', 'gearmotor'], // bridge drive type system options
  'bridge drive diagram': "separate drive", // bridge drive diagram
  'bridge drive diagram options': const ['central drive', 'separate drive'], // bridge drive diagram options
  'bridge control system of synchronous movement': "present", // bridge control system of synchronous movement
  'bridge control system of synchronous movement options': const ['present', 'absent'], // bridge control system of synchronous movement options
  'type crane rail': "KR-70", // type crane rail
  'crane rail length': 50.0, // crane rail length
  // General crane parameters
  'crane purpose': "industrial purpose", // crane purpose
  'crane purpose options': const ['industrial purpose', 'metallurgical purpose', 'special purpose', 'marine purpose'], // crane purpose options
  'explosion-fire-safe crane purpose': "industrial purpose", // explosion-fire-safe crane purpose
  'explosion-fire-safe crane purpose options': const ['industrial purpose', 'fire-safe purpose', 'explosion-safe purpose'], // explosion-fire-safe crane purpose options
  'marking of fire/explosion hazardous operating environment': "", // marking of fire/explosion hazardous operating environment
  'duty class': "A5", // duty class
  'duty class options': List.generate(12, (index) => 'A$index'), // duty class options
  'climatic design and placement category crane': "У3", // climatic design and placement category crane
  'climatic design and placement category crane options': const [ // climatic design and placement category crane options
    'У1', 'У2', 'У3', 'У5', 'ХЛ1', 'ХЛ2', 'ХЛ3', 'УХЛ4', 'УХЛ4.1', 'УХЛ4.2',
    'О4', 'О4.1', 'О4.2', 'Т5', 'ТС2', 'В3', 'В3.1', 'В4.1', 'ОМ.4', 'В5'
  ],
  'crane wind area': "II", // crane wind area
  'crane wind area options': const ['0', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'морской'], // crane wind area options
  'max use temperature': 40, // max use temperature
  'min use temperature': -20, // min use temperature
  'basic crane control': "pendant control", // basic crane control
  'basic crane control options': const ['crane cab', 'pendant control', 'remote control', 'cab/remote control'], // basic crane control options
  'cab location': "bridge edge", // cab location
  'cab location options': const ['bridge edge', 'bridge span center', 'crane trolley', 'None value'], // cab location options
  'identical hoists volume': 1, // identical hoists volume
  'max crane mass': 8.5, // max crane mass
  'max wheel load': 45.0, // max wheel load
  // Crane dimensions
  'span': 10.5, // span
  'left edge approach lifting device': 0.3, // left edge approach lifting device
  'right edge approach lifting device': 0.3, // right edge approach lifting device
  'vertical distance from crane rail to lifting device': 0.5, // vertical distance from crane rail to lifting device
  'maximum vertical distance from the crane rail to the top of the crane': 1.8, // maximum vertical distance from the crane rail to the top of the crane
  'max crane base': 4.2, // max crane base
  'max width crane': 2.1, // max width crane
};