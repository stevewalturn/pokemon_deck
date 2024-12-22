import 'package:flutter/material.dart';
import 'package:pokemon_deck/features/home/widgets/pokemon_card_grid.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
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
      appBar: AppBar(
        title: const Text('Pokemon Deck'),
        backgroundColor: kcPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: viewModel.showDialog,
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: viewModel.showBottomSheet,
          ),
        ],
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
              : PokemonCardGrid(
                  cards: viewModel.cards,
                  onCardTap: viewModel.navigateToCardDetail,
                  onCardDelete: viewModel.removeCard,
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.loadCards,
        backgroundColor: kcPrimaryColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.initialize();
}
