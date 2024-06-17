import 'package:exam_file/models/karta.dart';
import 'package:exam_file/services/card_http_service.dart';

class CardsController {
  final _cardsHttpService = CardsHttpService();

  Future<List<Karta>> getCards() async {
    return await _cardsHttpService.getCards();
  }
}
