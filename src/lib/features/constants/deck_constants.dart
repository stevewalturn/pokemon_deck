class DeckConstants {
  static const int standardDeckSize = 60;
  static const int minimumDeckSize = 60;
  static const int maximumDeckSize = 60;
  static const int maxCopiesOfSameCard = 4;
  static const int maxEnergyCards = 15;
  static const int maxTrainerCards = 30;
  static const int maxPokemonCards = 15;

  // Error messages
  static const String deckSizeError =
      'A Pokémon deck must contain exactly 60 cards';
  static const String maxCopiesError =
      'You can only have up to 4 copies of the same card in your deck';
  static const String energyLimitError =
      'Your deck cannot contain more than 15 energy cards';
  static const String trainerLimitError =
      'Your deck cannot contain more than 30 trainer cards';
  static const String pokemonLimitError =
      'Your deck cannot contain more than 15 Pokémon cards';
}
