class Card {
  String id;
  String cardNum;
  String expiryDate;
  String cvv;
  String cardHolder;

  Card({this.id, this.cardNum, this.expiryDate, this.cvv, this.cardHolder});
  Card.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            cardNum: json['cardNum'],
            expiryDate: json['expiryDate'],
            cvv: json['cvv'],
            cardHolder: json['cardHolder']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'cardNum': cardNum,
        'expiryDate': expiryDate,
        'cvv': cvv,
        'cardHolder': cardHolder
      };
}
