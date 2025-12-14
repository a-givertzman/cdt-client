import 'package:cdt_client/presentation/initial_page/widgets/first_page.dart';
import 'package:cdt_client/presentation/initial_page/widgets/second_page.dart';
import 'package:flutter/material.dart';
import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/pages_switch_with_bottom_indication.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/page_config.dart';
import 'package:cdt_client/presentation/cargo_carier_selection_page/cargo_carier_selection_page.dart';
///
/// [InitialPage] body widget.
/// The form provides view / edit of [initial data](https://github.com/a-givertzman/cdt-math/blob/Docs-hoist-mechanism-Hoist/docs/input_output_data.md).
/// Access to edit may be restricted depends on user privileges.
class InitialBody extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [_fields] - temporary example of InitialPage content
  InitialBody({
    super.key,
  })  : _fields = SgocInit(sgocInit);
  //
  @override
  State<InitialBody> createState() => _InitialBodyState();
}
//
class _InitialBodyState extends State<InitialBody> {
  bool _isFirstPageValid = false;
  bool _isSecondPageValid = false;
  int _currentPageIndex = 0;
  //
  @override
  Widget build(BuildContext context) {
    return PagesSwitch(
      pages: [
        PageConfig(
          name: 'main_mechanisms',
          builder: (context) => FirstPage(
            fields: widget._fields,
            onValidationChanged: (bool isValid) => 
              setState(() {
                _isFirstPageValid = isValid;
                _currentPageIndex = 0;
              }),
          ),
        ),
        PageConfig(
          name: 'general_parameters',
          builder: (context) => SecondPage(
            fields: widget._fields,
            onValidationChanged: (bool isValid) =>
             setState(() {
               _isSecondPageValid = isValid;
               _currentPageIndex = 1;
             }),
          ),
        ),
      ],
      isPageValid: () {
        if (_currentPageIndex == 0) return _isFirstPageValid;
        if (_currentPageIndex == 1) return _isSecondPageValid;
        return false;
      },
      formsSubmission: () => 
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CargoCarierSelectionPage(),
            settings: const RouteSettings(name: "/cargoCarierSelectionPage"),
          ),
        ),
    );
  }
}
//
//
//
//
final Map<String, Object?> sgocInit = {
  // Hoist parameters
  'load': '5.0', // load
  'lifting-height': '6.0', // lifting height
  'lifting-device': { // lifting device
    'value': "hook block",
    'options': const ['hook block', 'electro-hydraulic grab', 'electromagnet'], // lifting device options
  },
  'rated-traveling-hoist-speed': '8.0', // rated traveling hoist speed
  'slow-traveling-hoist-speed': '1.5', // slow traveling hoist speed
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
    'options': const 
    ['нет замедленной скорости', 
    'постоянная замедленная скорость', 
    'постоянная замедленная скорости до отрыва груза от земли', 
    'система бесступенчатого управления переменной скоростью', 
    'после предварительного натяжения разгон до выбранной скорости'], // lifting mechanism drive type options
  },
  'type-of-lifted-load': {   // type of lifted load
    'value': "safe",
    'options': const ['safe', 'dangerous'], // type of lifted load options
  },
  // Trolley running mechanism
  'rated-traveling-trolley-speed': '20.0',
  'slow-traveling-trolley-speed': '5.0',
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
  'rated-traveling-bridge-speed': '32.0',
  'slow-traveling-bridge-speed': '8.0',
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
