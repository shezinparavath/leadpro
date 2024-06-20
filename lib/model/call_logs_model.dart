class CallLogsCardModel {
  final String calledBy;
  final String duration;
  final String calledOn;
  const CallLogsCardModel(
      {required this.calledBy, required this.duration, required this.calledOn});
}

const List<CallLogsCardModel> callLogList = [
  CallLogsCardModel(
      calledBy: 'Admin', duration: '4 m,58 s', calledOn: '01-05-2024 03:38 PM'),
  CallLogsCardModel(
      calledBy: 'Admin',
      duration: '21 m,58 s',
      calledOn: '28-05-2024 03:38 PM'),
  CallLogsCardModel(
      calledBy: 'Admin', duration: '2 m,58 s', calledOn: '30-05-2024 03:38 PM'),
  CallLogsCardModel(
      calledBy: 'Admin', duration: '3 m,58 s', calledOn: '21-06-2024 03:38 PM'),
];
