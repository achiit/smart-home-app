class HomeModel {
  int homeID;
  int userID;
  String homeName;
 

  HomeModel({
    required this.homeID,
    required this.userID,
    required this.homeName,

  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      homeID: json['homeID'],
      userID: json['userID'],
      homeName: json['homeName'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeID': homeID,
      'userID': userID,
      'homeName': homeName,
 
    };
  }
}