///
/// # The kind of the event
/// - may contains the information about the specific request or reply
/// - unknown - means parsing error
enum EventKind {
  /// Initial data request
  initRequest,
  /// Reply to Initial data request
  initReply,
  /// Unrecognised kind, for handling error 
  unknown;
  // ///
  // /// Cause of transmission of JDS package
  // const EventKind();
  ///
  /// Returns [EventKind] built from string
  factory EventKind.fromString(String val) {
    return switch(val) {
      'init-request'      => EventKind.initRequest,
      'init-reply'        => EventKind.initReply,
      _                   => EventKind.unknown,
    };
  }
}