import 'dart:convert';

import 'package:cdt_client/domain/entities/cot.dart';
import 'package:cdt_client/domain/entities/event_kind.dart';
import 'package:cdt_client/domain/types/bytes.dart';
import 'package:flutter/foundation.dart';
import 'package:hmi_core/hmi_core_log.dart';

///
/// Container for transfering messages
class Event {
  final _log = Log('Event');
  late final String name;
  late final Cot cot;
  late final EventKind kind;
  late final Map<String, dynamic> body;
  ///
  /// Returns [Event] new instance
  /// - [name] - Name of the event
  /// - [cot] - Cause of transmission
  /// - [kind] - The kind of the event, may contains the information about the specific request or reply
  /// - [body] - The content of the event, may contains the request or reply it self
  Event(
    this.name,
    this.cot,
    this.kind,
    this.body,
  );
  ///
  /// Returns [Event] parsed from json bytes
  Event.fromBytes(Bytes bytes) {
      String val = utf8.decode(bytes);
    _fromJson(val);
  }
  ///
  /// Returns [Event] parsed from json string
  Event.fromJson(String val) {
    _fromJson(val);
  }
  ///
  /// Parse from json string
  void _fromJson(String val) {
    final map = json.decode(val) as Map<String, dynamic>;
    final mapName = map['name'] as String?;
    if (mapName != null) {
      name = mapName;
    } else {
      name = '';
      _log.warn('.fromJson | Field `name` missed in $map');
    }
    final mapCot = map['cot'] as String?;
    if (mapCot != null) {
      cot = Cot.fromString(mapCot);
    } else {
      cot = Cot.unknown;
      _log.warn('.fromJson | Field `cot` missed in $map');
    }
    final mapKind = map['kind'] as String?;
    if (mapKind != null) {
      kind = EventKind.fromString(mapKind);
    } else {
      kind = EventKind.unknown;
      _log.warn('.fromJson | Field `kind` missed in $map');
    }
    final mapBody = map['body'] as Map<String, dynamic>?;
    if (mapBody != null) {
      body = mapBody;
    } else {
      body = {};
      _log.warn('.fromJson | Field `body` missed or empty in $map');
    }
  }
  ///
  /// Returns bytes representation of the [Event]
  Uint8List toBytes() {
    final map = {
      'name': name,
      'cot': cot,
      'kind': kind,
      'body': body,
    };
    final jsonVal = json.encode(map);
    return utf8.encode(jsonVal);
  }
  //
  @override
  String toString() {
    return 'Event{ name: $name, cot: $cot, kind: $kind, body: $body }';
  }
  //
  @override
  bool operator ==(Object other) {
    if (other is Event) {
      return other.name == name 
          && other.cot == cot
          && other.kind == kind
          && mapEquals(other.body, body);
    }
    return false;
  }
  //
  @override
  int get hashCode => '$this'.hashCode;
}