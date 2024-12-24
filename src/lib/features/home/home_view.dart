import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';
import 'package:pokemon_deck/features/home/widgets/swipable_deck_widget.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcPokemonBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Pokémon Deck Builder',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kcPokemonPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const Gap(20),
              Text(
                viewModel.deckSizeLabel,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const Gap(20),
              Expanded(
                child: SwipableDeckWidget(
                  cards: viewModel.pokemonCards,
                  onSwipeLeft: viewModel.onSwipeLeft,
                  onSwipeRight: viewModel.onSwipeRight,
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: kcPokemonAccentColor,
                    onPressed: viewModel.showDialog,
                    child: const Text(
                      'Deck Rules',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: kcPokemonSecondaryColor,
                    onPressed: viewModel.showBottomSheet,
                    child: const Text(
                      'Card Limits',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
