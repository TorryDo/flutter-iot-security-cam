class QrData {
  final String code;
  final DateTime startDateTime;
  final DateTime? endDateTime;
  final bool isEnabled;

  const QrData({
    required this.code,
    required this.startDateTime,
    this.endDateTime,
    this.isEnabled = true,
  });
}
