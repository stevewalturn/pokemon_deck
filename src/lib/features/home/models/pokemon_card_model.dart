import 'package:equatable/equatable.dart';

class PokemonCard extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String type;
  final int energyCost;
  final String rarity;
  final String description;

  const PokemonCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.energyCost,
    required this.rarity,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [id, name, imageUrl, type, energyCost, rarity, description];

  factory PokemonCard.mock() {
    return const PokemonCard(
      id: '1',
      name: 'Pikachu',
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/cards/web/SM9/SM9_EN_33.png',
      type: 'Electric',
      energyCost: 2,
      rarity: 'Rare',
      description: 'Mouse Pokémon. Length: 1\'04", Weight: 13.2 lbs.',
    );
  }
}
