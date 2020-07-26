import 'package:bronco2/models/card_model.dart';
import 'package:bronco2/services/rest_service.dart';

class CardDataService {
  static final CardDataService _instance = CardDataService._constructor();
  factory CardDataService() {
    return _instance;
  }

  CardDataService._constructor();
  final rest = RestService();

  Future<List<Card>> getAllCard() async {
    final listJson = await rest.get('cards');

    return (listJson as List)
        .map((itemJson) => Card.fromJson(itemJson))
        .toList();
  }

  Future deleteCard({String cardNum}) async {
    await rest.delete('cards/$cardNum');
  }

  Future<Card> createCard({Card allCard}) async {
    final json = await rest.post('cards', data: allCard);
    return Card.fromJson(json);
  }

  Future<Card> getCard({String cardNum, Card allCard}) async {
    final json = await rest.get('cards/$cardNum');
    return Card.fromJson(json);
  }

  Future<Card> updateCard({String cardNum, Card allCard}) async {
    final json = await rest.patch('cards/$cardNum', data: allCard);
    return Card.fromJson(json);
  }
}
