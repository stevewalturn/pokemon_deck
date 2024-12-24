import 'package:pokemon_deck/features/home/models/pokemon_card_model.dart';

class DeckService {
  final List<PokemonCard> _initialDeck = [
    // Pokemon Cards (15)
    PokemonCard(
      id: '1',
      name: 'Pikachu',
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/cards/web/SM9/SM9_EN_33.png',
      type: 'Electric',
      energyCost: 2,
      rarity: 'Rare',
      description: 'Mouse Pokémon. Length: 1\'04", Weight: 13.2 lbs.',
    ),
    // Add 14 more Pokemon cards with similar structure...

    // Energy Cards (15)
    PokemonCard(
      id: '16',
      name: 'Electric Energy',
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/cards/web/SM1/SM1_EN_168.png',
      type: 'Energy',
      energyCost: 0,
      rarity: 'Common',
      description: 'Provides Electric energy to Pokemon.',
    ),
    // Add 14 more Energy cards...

    // Trainer Cards (30)
    PokemonCard(
      id: '31',
      name: 'Professor Oak',
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/cards/web/BS/BS_EN_88.png',
      type: 'Trainer',
      energyCost: 0,
      rarity: 'Rare',
      description: 'Draw 7 cards.',
    ),
    // Add 29 more Trainer cards...
  ];

  List<PokemonCard> getInitialDeck() {
    return List.from(_initialDeck);
  }

  bool isDeckValid(List<PokemonCard> deck) {
    if (deck.length != 60) {
      return false;
    }

    // Additional validation logic can be added here
    return true;
  }
}
