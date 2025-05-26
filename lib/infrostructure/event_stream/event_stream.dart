import 'dart:async';
import 'package:cdt_client/domain/entities/event.dart';
import 'package:hmi_core/hmi_core_log.dart';

import 'message.dart';
///
/// Provides event based messaging with the backend.
class EventStream {
  final _log = const Log("EventStream");
  final Message _message;
  // - `_subscriptions` - subscriptions on certain device
  final Map<String, StreamController<Event>> _subscriptions = {};
  ///
  /// Creates a new instance of [EventStream] with incoming [message]
  EventStream({
    required Message message,
  }) : _message = message {
    _listenConnection();
  }
  ///
  /// Returns a stream of [Event] for a given subscription [name]. Creates a new stream if one doesn't exist.
  Stream<Event> stream(String name) {
    if (!_subscriptions.containsKey(name)) {
      _subscriptions[name] = StreamController<Event>.broadcast();
    }
    return _subscriptions[name]!.stream;
  }
  ///
  /// Listening to the events from the connection.
  void _listenConnection() {
    _message.stream.listen(
      (event) {
        final name = event.name;
        final controller = _subscriptions[name];
        if (controller != null) {
          controller.add(event);
        }
      },
      onDone: () async {
        _log.warn('._listenConnection.listen | Done');
        _message.close();
        await Future.delayed(const Duration(milliseconds: 100));
        _listenConnection();
      },
      onError: (err) {
        _log.warn('._listenConnection.listen | Connection error: $err');
      },
    );
  }
  ///
  /// Releases all resources.
  void close() {
    _message.close();
    for (var controller in _subscriptions.values) {
      controller.close();
    }
    _subscriptions.clear();
  }
}
