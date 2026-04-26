
enum ConnectionType{mobile,wifi}

abstract class InternetState{}

class InternetLoading extends InternetState{}
class InternetConnected extends InternetState{
  final ConnectionType connectionType;
  InternetConnected(this.connectionType);
}
class InternetDisConnected extends InternetState{
}
