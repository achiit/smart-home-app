class UserDeviceMappingModel {
  int mappingID;
  int userID;
  int deviceID;

  UserDeviceMappingModel({
    required this.mappingID,
    required this.userID,
    required this.deviceID,
  });
  factory UserDeviceMappingModel.fromJson(Map<String, dynamic> json) {
    return UserDeviceMappingModel(
      mappingID: json['mappingID'],
      userID: json['userID'],
      deviceID: json['deviceID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mappingID': mappingID,
      'userID': userID,
      'deviceID': deviceID,
    };
  }
}
