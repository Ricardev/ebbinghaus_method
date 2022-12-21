class CameraError implements Exception {
  final String message;
  CameraError(this.message);
}

enum CameraErrorStatusCode {
  failure(-1),
  success(1);

  final int statusCode;
  const CameraErrorStatusCode(this.statusCode);
}

class CameraErrorMessages {}
