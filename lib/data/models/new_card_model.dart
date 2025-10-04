class NewCardModel {
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  NewCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  factory NewCardModel.toJson(Map<String, dynamic> json) {
    return NewCardModel(
      cardNumber: json["cardNumber"],
      expiryDate: json["expiryDate"],
      securityCode: json["securityCode"],
    );
  }

  Map<String, dynamic> toJson() => {
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'securityCode': securityCode,
  };
}
