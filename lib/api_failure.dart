/// The outcomes of a call are DISTINCT, not one generic error.
///
/// Six different things go wrong when an app talks to a server, and collapsing
/// them into "something went wrong" leaves the person unable to act: they do
/// not know whether to retype the password, check the signal, or just wait.
///
/// `rateLimited` is the one most often mislabelled. It is not a user error:
/// it is a defence that worked, and it should be said as such.
library;

enum ApiFailureKind {
  /// No route to the server. Retrying may work; the input is not at fault.
  network,

  /// Credentials were read and rejected. Only the person can fix this.
  invalidCredentials,

  /// The server said "too many". A defence that worked, not a mistake.
  rateLimited,

  /// A session was valid and no longer is. Different from never having had one.
  sessionExpired,

  /// The server failed. Nothing the caller did causes this.
  server,

  /// The server answered, and the answer is not what it claims to send.
  malformedResponse,
}

class ApiFailure implements Exception {
  final ApiFailureKind kind;

  /// Only meaningful for [ApiFailureKind.rateLimited]. Null means the server
  /// did not say how long — which is different from "retry immediately".
  final Duration? retryAfter;

  final int? statusCode;

  const ApiFailure(this.kind, {this.retryAfter, this.statusCode});

  @override
  String toString() => 'ApiFailure(${kind.name}, status=$statusCode)';
}

/// The text does NOT live in here.
///
/// An exception that carries the sentence to show speaks one language, and you
/// find that out the day you need a second one — by which time it is scattered
/// everywhere. Pass a lookup instead: the caller owns the words.
extension ApiFailureText on ApiFailure {
  T resolve<T>(T Function(ApiFailureKind kind, Duration? retryAfter) lookup) =>
      lookup(kind, retryAfter);
}
