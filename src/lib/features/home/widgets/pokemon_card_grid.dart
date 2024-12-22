import 'package:flutter/material.dart';
import 'package:pokemon_deck/features/home/widgets/pokemon_card_tile.dart';
import 'package:pokemon_deck/models/pokemon_card.dart';

class PokemonCardGrid extends StatelessWidget {
  final List<PokemonCard> cards;
  final Function(String) onCardTap;
  final Function(String) onCardDelete;

  const PokemonCardGrid({
    Key? key,
    required this.cards,
    required this.onCardTap,
    required this.onCardDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return PokemonCardTile(
          card: card,
          onTap: () => onCardTap(card.id),
          onDelete: () => onCardDelete(card.id),
        );
      },
    );
  }
}
