import 'package:flutter/material.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';
import 'package:pokemon_deck/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'card_detail_viewmodel.dart';

class CardDetailView extends StackedView<CardDetailViewModel> {
  final String cardId;

  const CardDetailView({
    Key? key,
    required this.cardId,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CardDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.card?.name ?? 'Card Detail'),
        backgroundColor: kcPrimaryColor,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? Center(
                  child: Text(
                    viewModel.modelError.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : _buildCardDetail(viewModel),
    );
  }

  Widget _buildCardDetail(CardDetailViewModel viewModel) {
    final card = viewModel.card;
    if (card == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              card.imageUrl,
              height: 300,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ),
          verticalSpaceMedium,
          Text(
            card.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceSmall,
          Text('Type: ${card.type}'),
          Text('Rarity: ${card.rarity}'),
          Text('HP: ${card.hp}'),
          verticalSpaceSmall,
          const Text(
            'Attacks:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...card.attacks.map((attack) => Text('• $attack')),
          verticalSpaceSmall,
          Text('Weakness: ${card.weakness}'),
          Text('Resistance: ${card.resistance}'),
          verticalSpaceMedium,
          const Text(
            'Description:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(card.description),
        ],
      ),
    );
  }

  @override 
  CardDetailViewModel viewModelBuilder(BuildContext context) =>
      CardDetailViewModel();

  @override
  void onViewModelReady(CardDetailViewModel viewModel) =>
      viewModel.initialize(cardId);
}