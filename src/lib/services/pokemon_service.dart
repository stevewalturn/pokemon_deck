import 'package:pokemon_deck/models/pokemon_card.dart';

class PokemonService {
  final List<PokemonCard> _cards = [
    // Sample data - in a real app this would come from an API or database
    PokemonCard(
      id: '1',
      name: 'Pikachu',
      imageUrl: 'https://example.com/pikachu.png',
      type: 'Electric',
      rarity: 'Rare',
      description: 'Mouse Pokémon',
      hp: 60,
      attacks: ['Thunder Shock', 'Quick Attack'],
      weakness: 'Ground',
      resistance: 'Flying',
    ),
    // Add more sample cards as needed
  ];

  Future<List<PokemonCard>> getCards() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      return _cards;
    } catch (e) {
      throw 'Failed to load Pokemon cards. Please check your connection and try again.';
    }
  }

  Future<PokemonCard> getCardById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final card = _cards.firstWhere(
        (card) => card.id == id,
        orElse: () => throw 'Card not found',
      );
      return card;
    } catch (e) {
      throw 'Could not find the Pokemon card. Please try again later.';
    }
  }

  Future<void> addCard(PokemonCard card) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _cards.add(card);
    } catch (e) {
      throw 'Failed to add the Pokemon card. Please try again.';
    }
  }

  Future<void> removeCard(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _cards.removeWhere((card) => card.id == id);
    } catch (e) {
      throw 'Failed to remove the Pokemon card. Please try again.';
    }
  }
}
