class EventInfo {
  EventInfo({this.bloc, this.event, this.timestamp});

  final String bloc;
  final String event;
  final DateTime timestamp;

  @override
  String toString() {
    return 'Event $event from Bloc $bloc was fired on $timestamp';
  }
}
