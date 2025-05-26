///
/// Cause of transmission of [Event]
enum Cot {
  /// 
  /// Information
  inf,
  /// 
  /// Command (reply is otional)
  act,
  /// 
  /// Command confirmation
  actCon,
  /// 
  /// Command error
  actErr,
  /// 
  /// Request (reply required)
  req,
  /// 
  /// Request confiramtion
  reqCon,
  /// 
  /// Request error
  reqErr,
  ///
  /// Unrecognised cot, for handling error 
  unknown;
  ///
  /// Cause of transmission of JDS package
  const Cot();
  ///
  /// Returns [Cot] built from string
  factory Cot.fromString(String cot) {
    return switch(cot) {
      'Inf'     => Cot.inf,
      'Act'     => Cot.act,
      'ActCon'  => Cot.actCon,
      'ActErr'  => Cot.actErr,
      'Req'     => Cot.req,
      'ReqCon'  => Cot.reqCon,
      'ReqErr'  => Cot.reqErr,
      _         => Cot.unknown,
    };
  }
  //
  @override
  String toString() {
    return switch(this) {
      inf     => 'Inf',
      act     => 'Act',
      actCon  => 'ActCon',
      actErr  => 'ActErr',
      req     => 'Req',
      reqCon  => 'ReqCon',
      reqErr  => 'ReqErr',
      unknown => 'Unknown',
    };
  }
}