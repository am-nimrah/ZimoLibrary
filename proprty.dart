class Property {
  String? description;
  String? interiorFeatures;
  String? bedroomFeatures;
  String? bathroomFeatures;
  String? receptionRoomFeatures;
  String? appliances;
  String? otherRoomFeatures;
  String? exteriorFeatures;
  DateTime? deadline;

  Property({
    this.description,
    this.interiorFeatures,
    this.bedroomFeatures,
    this.bathroomFeatures,
    this.receptionRoomFeatures,
    this.appliances,
    this.otherRoomFeatures,
    this.exteriorFeatures,
    this.deadline,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      description: json['property_description'],
      interiorFeatures: json['interior_features'],
      bedroomFeatures: json['bedroom_features'],
      bathroomFeatures: json['bathroom_features'],
      receptionRoomFeatures: json['reception_room_features'],
      appliances: json['appliances'],
      otherRoomFeatures: json['other_room_features'],
      exteriorFeatures: json['exterior_features'],
      deadline: DateTime.parse(json['deadline']),
    );
  }
}
