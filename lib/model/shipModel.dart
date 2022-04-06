class ShipModel {
  ShipModel({
    required this.shipName,
    required this.shipFacts,
  });

  String shipName;
  ShipFacts shipFacts;

  factory ShipModel.fromJson(Map<String, dynamic> json) => ShipModel(
    shipName: json["shipName"] as String,
    shipFacts: ShipFacts.fromJson(json["shipFacts"]),
  );

  Map<String, dynamic> toJson() => {
    "shipName": shipName,
    "shipFacts": shipFacts.toJson(),
  };
}

class ShipFacts {
  ShipFacts({
    required this.passengerCapacity,
    required this.crew,
    required this.inauguralDate,
  });

  String passengerCapacity;
  String crew;
  String inauguralDate;

  factory ShipFacts.fromJson(Map<String, dynamic> json) => ShipFacts(
    passengerCapacity: json["passengerCapacity"],
    crew: json["crew"],
    inauguralDate: json["inauguralDate"],
  );

  Map<String, dynamic> toJson() => {
    "passengerCapacity": passengerCapacity,
    "crew": crew,
    "inauguralDate": inauguralDate,
  };
}
