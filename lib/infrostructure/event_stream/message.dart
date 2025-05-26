import 'dart:async';
import 'dart:typed_data';
import 'package:cdt_client/domain/entities/event.dart';
import 'package:hmi_core/hmi_core_failure.dart';
import 'package:hmi_core/hmi_core_log.dart';
import 'package:hmi_core/hmi_core_option.dart';
import 'package:hmi_core/hmi_core_result.dart';
import 'package:cdt_client/domain/types/bytes.dart';
import 'package:cdt_client/infrostructure/event_stream/connect.dart';
import 'package:ext_rw/src/api_client/message/message_build.dart';
import 'package:ext_rw/src/api_client/message/field_syn.dart';
import 'package:ext_rw/src/api_client/message/field_id.dart';
import 'package:ext_rw/src/api_client/message/field_kind.dart';
import 'package:ext_rw/src/api_client/message/field_size.dart';
import 'package:ext_rw/src/api_client/message/field_data.dart';
import 'package:ext_rw/src/api_client/message/parse_data.dart';
import 'package:ext_rw/src/api_client/message/parse_size.dart';
import 'package:ext_rw/src/api_client/message/parse_kind.dart';
import 'package:ext_rw/src/api_client/message/parse_id.dart';
import 'package:ext_rw/src/api_client/message/parse_syn.dart';
///
/// Converts `Stream<List<int>>` into `Stream<Event>`.
/// Sends [Event] converting it into `List<int>`.
class Message {
  final _log = const Log("Message");
  // - `_connect` - Socket connection
  final Connect _connect;
  // - '_controller` - StreamController output stream of bytes
  final StreamController<Event> _controller = StreamController();
  bool _isStarted = false;
  int _messageId = 0;
  // - `_subscriptions` - subscriptions on certain device
  late StreamSubscription? _subscription;
  final MessageBuild _messageBuild = MessageBuild(
    syn: FieldSyn.def(),
    id: FieldId.def(),
    kind: FieldKind.bytes,
    size: FieldSize.def(),
    data: FieldData([]),
  );
  ///
  /// Creates a new insance of [Message] with established [connect].
  Message({required Connect connect}) : _connect = connect;
  ///
  /// Stream of points coming from the connection line.
  /// Returns a stream of [Event].
  Stream<Event> get stream {
    if (!_isStarted) {
      _isStarted = true;
      final message = ParseData(
        field: ParseSize(
          size: FieldSize.def(),
          field: ParseKind(
            field: ParseId(
              id: FieldId.def(),
              field: ParseSyn.def(),
            ),
          ),
        ),
      );
      _subscription = _connect.stream.listen((Bytes bytes) {
        // _log.debug('.listen.onData | Event: $event');
        Bytes? input = bytes;
        bool isSome = true;
        while (isSome) {
          switch (message.parse(input)) {
            case Some<(FieldId, FieldKind, FieldSize, Bytes)>(
                value: (final _, final _, final _, final bytes)
              ):
              // _log.debug('.listen.onData | id: $id,  kind: $kind,  size: $size, bytes: ${bytes.length > 16 ? bytes.sublist(0, 16) : bytes}');
              switch (_parse(bytes)) {
                case Ok<Event, Failure>(value: final point):
                  _controller.add(point);
                case Err<Event, Failure>(:final error):
                  _log.warn('.stream.listen | Error: $error');
              }
              input = null;
            case None():
              isSome = false;
            // _log.debug('.listen.onData | None');
          }
        }
      }, onDone: () async {
        _log.debug('.stream.listen.onDone | Done');
        await _subscription?.cancel();
        await _connect.close();
      }, onError: (err) {
        _log.warn('.stream.listen.onError | Error: $err');
      });
    }
    return _controller.stream;
  }
  ///
  /// Sends [event] to the connection line.
  void add(Event event) {
    Uint8List bytes = event.toBytes();
    // _log.debug('.add | id: $id,  bytes: ${bytes.length > 16 ? bytes.sublist(0, 16) : bytes}');
    _messageId++;
    _connect.add(_messageBuild.build(bytes, id: _messageId));
  }
  //
  //
  Result<Event, Failure> _parse(List<int> bytes) {
    try {
      return Ok(Event.fromBytes(bytes));
    } catch (err) {
      return Err(Failure(message: 'Message._parse | Parsing error: $err', stackTrace: StackTrace.current));
    }
  }
  ///
  /// Returns a [Future] that completes once all buffered data is accepted by the underlying [StreamConsumer].
  ///
  /// This method must not be called while an [addStream] is incomplete.
  ///
  /// NOTE: This is not necessarily the same as the data being flushed by the operating system.
  Future flush() {
    return _connect.flush();
  }
  ///
  /// Reases all resources.
  Future<void> close() async {
    await _subscription?.cancel();
    await _connect.close();
    await _controller.close();
  }
}
