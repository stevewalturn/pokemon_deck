import 'package:flutter/material.dart';
import 'package:pokemon_deck/models/pokemon_card.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';
import 'package:pokemon_deck/ui/common/ui_helpers.dart';

class PokemonCardTile extends StatelessWidget {
  final PokemonCard card;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const PokemonCardTile({
    Key? key,
    required this.card,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  card.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: onDelete,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceTiny,
                  Text(
                    'Type: ${card.type}',
                    style: TextStyle(
                      color: kcMediumGrey,
                    ),
                  ),
                  Text(
                    'HP: ${card.hp}',
                    style: TextStyle(
                      color: kcMediumGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
