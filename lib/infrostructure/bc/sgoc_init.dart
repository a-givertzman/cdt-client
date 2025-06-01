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
class Data {
  static Map<String, dynamic> data = {
  // Hoist parameters
  "load": 5.0, 
  "lifting height": 6.0, 
  "lifting device": "hook block",
  "lifting device options": const ['hook block', 'electro-hydraulic grab', 'electromagnet'],
  "rated travelling hoist speed": 8.0, 
  "slow travelling hoist speed": 1.5, 
  "hoist group": "M5",
  "hoist group options": List.generate(8, (index) => 'M${index + 1}'),
  "lifting duration": "40%",
  "lifting duration options": const ['15%', '25%', '40%', '60%', '100%'],
  "hoist control system": "Variable Frequency Drive (VFD)",
  "hoist control system options": const [
    'Variable Frequency Drive (VFD)',
    'Relay-Contactor Control System',
    'Thyristor-Choke Control System',
  ],
  "lifting mechanism drive type": "HD3",
  "lifting mechanism drive type options": const ['HD1', 'HD2', 'HD3', 'HD4', 'HD5'],
  "type of lifted load": "safe",
  "type of lifted load options": const ['safe', 'dangerous'],
  // Trolley running mechanism
  "rated travelling trolley speed": 20.0,
  "slow travelling trolley speed": 5.0,
  "trolley group": "M4",
  "trolley group options": List.generate(8, (index) => 'M${index + 1}'),
  "trolley control system": "Variable Frequency Drive (VFD)",
  "trolley control system options": const [
    'Variable Frequency Drive (VFD)',
    'Relay-Contactor Control System',
    'Thyristor-Choke Control System',
  ],
  "trolley power system": "conductor bar",
  "trolley power system options": const ['festoon system', 'energy chain', 'conductor bar'],
  // Bridge running mechanism
  "rated travelling bridge speed": 32.0,
  "slow travelling bridge speed": 8.0, 
  "crane drive group": "M4",
  "crane drive group options": List.generate(8, (index) => 'M${index + 1}'),
  "bridge movement duration": "40%",
  "bridge movement duration options": const ['15%', '25%', '40%', '60%', '100%'],
  "bridge control system": "Variable Frequency Drive (VFD)",
  "bridge control system options": const [
    'Variable Frequency Drive (VFD)',
    'Relay-Contactor Control System',
    'Thyristor-Choke Control System',
  ],
  "crane power system": "conductor bar",
  "crane power system options": const ['festoon system', 'cable reel', 'energy chain', 'conductor bar'],
  "bridge drive type system": "gearmotor",
  "bridge drive type system options": const ['detailed bridge drive', 'gearmotor'],
  "bridge drive diagram": "separate drive",
  "bridge drive diagram options": const ['central drive', 'separate drive'],
  "bridge control system of synchronous movement": "present",
  "bridge control system of synchronous movement options": const ['present', 'absent'],
  "type crane rail": "KR-70",
  "crane rail length": 50.0,
  // General crane parameters
  "crane purpose": "industrial purpose",
  "crane purpose options": const ['industrial purpose', 'metallurgical purpose', 'special purpose', 'marine purpose'],
  "explosion-fire-safe crane purpose": "industrial purpose",
  "explosion-fire-safe crane purpose options": const ['industrial purpose', 'fire-safe purpose', 'explosion-safe purpose'],
  "marking of fire/explosion hazardous operating environment": "",
  "duty class": "A5",
  "duty class options": List.generate(12, (index) => 'A$index'),
  "climatic design and placement category crane": "У3",
  "climatic design and placement category crane options": const [
    'У1', 'У2', 'У3', 'У5', 'ХЛ1', 'ХЛ2', 'ХЛ3', 'УХЛ4', 'УХЛ4.1', 'УХЛ4.2',
    'О4', 'О4.1', 'О4.2', 'Т5', 'ТС2', 'В3', 'В3.1', 'В4.1', 'ОМ.4', 'В5'
  ],
  "crane wind area": "II",
  "crane wind area options": const ['0', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'морской'],
  "max use temperature": 40, 
  "min use temperature": -20,
  "basic crane control": "pendant control",
  "basic crane control options": const ['crane cab', 'pendant control', 'remote control', 'cab/remote control'],
  "cab location": "bridge edge",
  "cab location options": const ['bridge edge', 'bridge span center', 'crane trolley', 'None value'],
  "identical hoists volume": 1,
  "max crane mass": 8.5,
  "max wheel load": 45.0,
  // Crane dimensions
  "span": 10.5,
  "left edge approach lifting device": 0.3,
  "right edge approach lifting device": 0.3,
  "vertical distance from crane rail to lifting device": 0.5, 
  "maximum vertical distance from the crane rail to the top of the crane": 1.8,
  "max crane base": 4.2, 
  "max width crane": 2.1, 
  };
}