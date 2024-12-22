import 'package:pokemon_deck/app/app.locator.dart';
import 'package:pokemon_deck/models/pokemon_card.dart';
import 'package:pokemon_deck/services/pokemon_service.dart';

class HomeRepository {
  final _pokemonService = locator<PokemonService>();

  Future<List<PokemonCard>> getCards() async {
    try {
      return await _pokemonService.getCards();
    } catch (e) {
      throw 'Unable to load your Pokemon cards. Please try again later.';
    }
  }

  Future<void> removeCard(String id) async {
    try {
      await _pokemonService.removeCard(id);
    } catch (e) {
      throw 'Failed to remove the card from your deck. Please try again.';
    }
  }
}
