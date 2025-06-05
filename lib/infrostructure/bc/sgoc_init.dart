import 'package:hmi_core/hmi_core_failure.dart';
///
/// Storage parametrs for initialization Single Girder Overhead Crane
/// 
/// [CDT Docs refeerence](https://github.com/a-givertzman/cdt-math/blob/master/design/docs/algorithm_single_ginger_overhead_crane/part01_initialization/chapter01_initialData/chapter01_initialData.md)
class SgocInit {
  final Map<String, dynamic> _map;
  ///
  /// Returns new instance created with specified json map
  SgocInit(
    Map<String, dynamic> map
  ) :
    _map = map;
  ///
  /// Returns field value if exists
  String get(key) {
    final val = _map[key];
    if (val != null) {
      return val;
    }
    throw Failure(message: 'BcInit.get | internal _map does not contains `$key` key', stackTrace: StackTrace.current);
  }
}
// temprorary [InitialPage] content
// Data.dart
class Data {
  static Map<int, dynamic> data = {
    // Hoist parameters
    0: 5.0, // load
    1: 6.0, // lifting height
    2: "hook block", // lifting device
    3: const ['hook block', 'electro-hydraulic grab', 'electromagnet'], // lifting device options
    4: 8.0, // rated travelling hoist speed
    5: 1.5, // slow travelling hoist speed
    6: "M5", // hoist group
    7: List.generate(8, (index) => 'M${index + 1}'), // hoist group options
    8: "40%", // lifting duration
    9: const ['15%', '25%', '40%', '60%', '100%'], // lifting duration options
    10: "Variable Frequency Drive (VFD)", // hoist control system
    11: const [ // hoist control system options
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
    12: "HD3", // lifting mechanism drive type
    13: const ['HD1', 'HD2', 'HD3', 'HD4', 'HD5'], // lifting mechanism drive type options
    14: "safe", // type of lifted load
    15: const ['safe', 'dangerous'], // type of lifted load options
    // Trolley running mechanism
    16: 20.0, // rated travelling trolley speed
    17: 5.0, // slow travelling trolley speed
    18: "M4", // trolley group
    19: List.generate(8, (index) => 'M${index + 1}'), // trolley group options
    20: "Variable Frequency Drive (VFD)", // trolley control system
    21: const [ // trolley control system options
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
    22: "conductor bar", // trolley power system
    23: const ['festoon system', 'energy chain', 'conductor bar'], // trolley power system options
    // Bridge running mechanism
    24: 32.0, // rated travelling bridge speed
    25: 8.0, // slow travelling bridge speed
    26: "M4", // crane drive group
    27: List.generate(8, (index) => 'M${index + 1}'), // crane drive group options
    28: "40%", // bridge movement duration
    29: const ['15%', '25%', '40%', '60%', '100%'], // bridge movement duration options
    30: "Variable Frequency Drive (VFD)", // bridge control system
    31: const [ // bridge control system options
      'Variable Frequency Drive (VFD)',
      'Relay-Contactor Control System',
      'Thyristor-Choke Control System',
    ],
    32: "conductor bar", // crane power system
    33: const ['festoon system', 'cable reel', 'energy chain', 'conductor bar'], // crane power system options
    34: "gearmotor", // bridge drive type system
    35: const ['detailed bridge drive', 'gearmotor'], // bridge drive type system options
    36: "separate drive", // bridge drive diagram
    37: const ['central drive', 'separate drive'], // bridge drive diagram options
    38: "present", // bridge control system of synchronous movement
    39: const ['present', 'absent'], // bridge control system of synchronous movement options
    40: "KR-70", // type crane rail
    41: 50.0, // crane rail length
    // General crane parameters
    42: "industrial purpose", // crane purpose
    43: const ['industrial purpose', 'metallurgical purpose', 'special purpose', 'marine purpose'], // crane purpose options
    44: "industrial purpose", // explosion-fire-safe crane purpose
    45: const ['industrial purpose', 'fire-safe purpose', 'explosion-safe purpose'], // explosion-fire-safe crane purpose options
    46: "", // marking of fire/explosion hazardous operating environment
    47: "A5", // duty class
    48: List.generate(12, (index) => 'A$index'), // duty class options
    49: "У3", // climatic design and placement category crane
    50: const [ // climatic design and placement category crane options
      'У1', 'У2', 'У3', 'У5', 'ХЛ1', 'ХЛ2', 'ХЛ3', 'УХЛ4', 'УХЛ4.1', 'УХЛ4.2',
      'О4', 'О4.1', 'О4.2', 'Т5', 'ТС2', 'В3', 'В3.1', 'В4.1', 'ОМ.4', 'В5'
    ],
    51: "II", // crane wind area
    52: const ['0', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'морской'], // crane wind area options
    53: 40, // max use temperature
    54: -20, // min use temperature
    55: "pendant control", // basic crane control
    56: const ['crane cab', 'pendant control', 'remote control', 'cab/remote control'], // basic crane control options
    57: "bridge edge", // cab location
    58: const ['bridge edge', 'bridge span center', 'crane trolley', 'None value'], // cab location options
    59: 1, // identical hoists volume
    60: 8.5, // max crane mass
    61: 45.0, // max wheel load
    // Crane dimensions
    62: 10.5, // span
    63: 0.3, // left edge approach lifting device
    64: 0.3, // right edge approach lifting device
    65: 0.5, // vertical distance from crane rail to lifting device
    66: 1.8, // maximum vertical distance from the crane rail to the top of the crane
    67: 4.2, // max crane base
    68: 2.1, // max width crane
  };
}