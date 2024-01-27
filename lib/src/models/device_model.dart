class DeviceModel {
  int deviceID;
  int roomID;
  int userID;
  String deviceName;
  String deviceType;
  String status;

  DeviceModel({
    required this.deviceID,
    required this.roomID,
    required this.userID,
    required this.deviceName,
    required this.deviceType,
    required this.status,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceID: json['deviceID'],
      roomID: json['roomID'],
      userID: json['userID'],
      deviceName: json['deviceName'],
      deviceType: json['deviceType'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceID': deviceID,
      'roomID': roomID,
      'userID': userID,
      'deviceName': deviceName,
      'deviceType': deviceType,
      'status': status,
    };
  }
}