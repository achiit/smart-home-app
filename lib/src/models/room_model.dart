class RoomModel {
  int roomID;
  int homeID;
  String roomName;

  RoomModel({
    required this.roomID,
    required this.homeID,
    required this.roomName,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomID: json['roomID'],
      homeID: json['homeID'],
      roomName: json['roomName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomID': roomID,
      'homeID': homeID,
      'roomName': roomName,
    };
  }
}