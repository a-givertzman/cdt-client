import 'package:cdt_client/infrastructure/bc/sgoc_init.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/page_config.dart';
import 'package:cdt_client/presentation/core/widgets/pages_switch/pages_switch_with_bottom_indication.dart';
import 'package:cdt_client/presentation/result_page/widgets/first_page.dart';
import 'package:cdt_client/presentation/result_page/widgets/second_page.dart';
import 'package:cdt_client/presentation/result_page/widgets/third_page.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_translate.dart';
///
/// [ResultPage] body widget.
/// The form provides view / edit of [result data](https://github.com/a-givertzman/cdt-math/blob/Docs-hoist-mechanism-Hoist/docs/input_output_data.md).
/// Access to edit may be restricted depends on user privileges.
class ResultBody extends StatefulWidget {
  final SgocInit _fields;
  ///
  /// The body of the [InitialPage] widget.
  ///
  /// [_fields] - temporary example of ResultPage content
  ResultBody({
    super.key,
  })  : _fields = SgocInit(sgocInit);
  //
  @override
  State<ResultBody> createState() => _ResultBodyState();
}
//
class _ResultBodyState extends State<ResultBody> {
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
        PageConfig(
          name: 'general_parameters',
          builder: (context) => ThirdPage(
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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Data has saved'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'.loc),
              ),
            ],
          ),
        ),
    );
  }
}
//
//
//
final Map<String, Object?> sgocInit = {
  // General crane parameters
  'crane-index': 'K-001',
  'full-crane-type': 'Single Girder Overhead Crane',
  'span': '22.5',
  'duty-class': {
    'value': 'A5',
    'options': List.generate(8, (index) => 'A${index + 1}'),
  },
  'climatic-design-and-placement-category-crane': {
    'value': 'У3',
    'options': ['У1', 'У2', 'У3', 'У5', 'ХЛ1', 'ХЛ2', 'ХЛ3', 'УХЛ1', 'УХЛ2', 'Т1', 'Т2', 'Т3'],
  },
  'supply-voltage': '380',
  'supply-frequency': '50',
  'operating-temperature': '-20 to +40',
  'seismicity-msk-64': '7',
  'type-of-lifted-load': {
    'value': 'general',
    'options': ['general', 'hazardous', 'hot', 'explosive'],
  },
  'basic-crane-control': {
    'value': 'pendant control',
    'options': ['pendant control', 'cabin control', 'remote control', 'mixed control'],
  },
  'control-location': {
    'value': 'pendant',
    'options': ['pendant', 'cabin', 'remote', 'mixed'],
  },
  'crane-weight': '4500',
  'total-rated-power-drives': '45.2',

  // Hoist mechanism
  'hoist-name': 'Electric Wire Rope Hoist',
  'hoist-manufacturer': 'KONE',
  'load': '10.0',
  'lifting-height': '12.0',
  'max-lifting-height': '14.0',
  'hoist-tackle': '2',
  'rated-traveling-hoist-speed': '8.0',
  'slow-traveling-hoist-speed': '1.5',
  'hoist-group': {
    'value': 'M5',
    'options': List.generate(8, (index) => 'M${index + 1}'),
  },
  'electrical-equipment-protection-degree': 'IP54',
  'number-hoist-motors': '1',
  'rated-power-hoist-motor': '18.5',
  'rated-current-hoist-motor': '35.0',
  'control-method-hoist': {
    'value': 'VFD',
    'options': ['VFD', 'relay-contactor', 'thyristor'],
  },
  'manual-brake-release-hoist': {
    'value': 'available',
    'options': ['available', 'not available'],
  },

  // Trolley running mechanism
  'rated-traveling-trolley-speed': '20.0',
  'slow-traveling-trolley-speed': '5.0',
  'trolley-group': {
    'value': 'M4',
    'options': List.generate(8, (index) => 'M${index + 1}'),
  },
  'electrical-equipment-protection-degree-trolley': 'IP54',
  'number-trolley-motors': '2',
  'rated-power-trolley-motor': '2.2',
  'rated-current-trolley-motor': '4.8',
  'control-method-trolley': {
    'value': 'VFD',
    'options': ['VFD', 'relay-contactor', 'thyristor'],
  },
  'manual-brake-release-trolley': {
    'value': 'available',
    'options': ['available', 'not available'],
  },
  'limit-buffer-trolley': {
    'value': 'hydraulic',
    'options': ['hydraulic', 'spring', 'rubber', 'polyurethane'],
  },

  // Bridge running mechanism
  'rated-traveling-bridge-speed': '32.0',
  'slow-traveling-bridge-speed': '8.0',
  'bridge-group': {
    'value': 'M4',
    'options': List.generate(8, (index) => 'M${index + 1}'),
  },
  'bridge-movement-duration': {
    'value': '40%',
    'options': ['15%', '25%', '40%', '60%'],
  },
  'drive-marking': 'SEW',
  'drive-manufacturer': 'SEW-Eurodrive',
  'electrical-equipment-protection-degree-bridge': 'IP55',
  'number-bridge-motors': '4',
  'rated-power-bridge-motor': '4.0',
  'rated-current-bridge-motor': '8.5',
  'control-method-bridge': {
    'value': 'VFD',
    'options': ['VFD', 'relay-contactor', 'thyristor'],
  },
  'wheel-assembly': {
    'value': 'double-flange',
    'options': ['double-flange', 'single-flange'],
  },
  'crane-rail': 'A45',
  'manual-brake-release-bridge': {
    'value': 'available',
    'options': ['available', 'not available'],
  },
  'limit-buffer-bridge': {
    'value': 'hydraulic',
    'options': ['hydraulic', 'spring', 'rubber', 'polyurethane'],
  },

  // Crane metal structure
  'main-beam-profile': 'I-beam 30B1',
  'end-beam-name': 'Box Section End Beam',

  // Safety devices
  'hoist-limit-switch': {
    'value': 'rotary',
    'options': ['rotary', 'lever', 'proximity', 'magnetic'],
  },
  'load-limit-device': {
    'value': 'electronic',
    'options': ['electronic', 'mechanical', 'hydraulic'],
  },
  'trolley-travel-limit-switch': {
    'value': 'lever',
    'options': ['lever', 'proximity', 'rotary'],
  },
  'bridge-travel-limit-switch': {
    'value': 'lever',
    'options': ['lever', 'proximity', 'rotary'],
  },
  'light-signal': {
    'value': 'available',
    'options': ['available', 'not available'],
  },
  'sound-signal': {
    'value': 'available',
    'options': ['available', 'not available'],
  },
  'anti-collision-sensor': {
    'value': 'laser',
    'options': ['laser', 'ultrasonic', 'infrared', 'not available'],
  },
  'anemometer': {
    'value': 'available',
    'options': ['available', 'not available'],
  },

  // Power equipment
  'control-cabinet': 'Main Control Panel',
  'control-cabinet-protection-degree': 'IP54',

  // Hoist power supply
  'hoist-power-supply-type': {
    'value': 'conductor-bar',
    'options': ['conductor-bar', 'festoon-system', 'cable-reel'],
  },
  'hoist-guide-rail-type': 'C-profile',

  // Crane power supply
  'crane-power-supply-type': {
    'value': 'conductor-bar',
    'options': ['conductor-bar', 'festoon-system', 'cable-reel'],
  },
  'crane-guide-rail-type': 'I-profile',
};