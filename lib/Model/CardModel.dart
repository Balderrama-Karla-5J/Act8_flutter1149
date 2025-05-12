class CardModel {
  final int? id;
  final String? name;
  final String? bankname;
  final String? number;
  final String? currency;
  //Quitar los '?' y cambiarlos por 'required' al la izquierda de cada 'this'
  // en caso de no querer campos null

  final int? available;

  CardModel(
      {this.id,
      this.name,
      this.bankname,
      this.number,
      this.currency,
      this.available});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bankname': bankname,
      'number': number,
      'currency': currency,
      'available': available,
    };
  }

  CardModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        bankname = json['bankname'],
        number = json['number'],
        currency = json['currency'],
        available = json['available'];
}
