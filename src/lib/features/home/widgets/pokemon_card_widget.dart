import 'package:flutter/material.dart';
import 'package:pokemon_deck/features/home/models/pokemon_card_model.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';
import 'package:pokemon_deck/ui/common/ui_helpers.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonCard card;
  final double rotation;
  final double scale;

  const PokemonCardWidget({
    required this.card,
    this.rotation = 0,
    this.scale = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          height: 400,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kcPokemonCardBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  card.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: kcPokemonSecondaryColor.withOpacity(0.3),
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: kcPokemonSecondaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kcPokemonPrimaryColor,
                      ),
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        _buildChip(card.type),
                        horizontalSpaceSmall,
                        _buildChip('${card.energyCost} Energy'),
                      ],
                    ),
                    verticalSpaceSmall,
                    Text(
                      card.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kcMediumGrey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpaceSmall,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        card.rarity,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kcPokemonAccentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: kcPokemonSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: kcPokemonSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
