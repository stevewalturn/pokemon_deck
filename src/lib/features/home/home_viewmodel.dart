import 'package:pokemon_deck/app/app.bottomsheets.dart';
import 'package:pokemon_deck/app/app.dialogs.dart';
import 'package:pokemon_deck/app/app.locator.dart';
import 'package:pokemon_deck/features/constants/deck_constants.dart';
import 'package:pokemon_deck/features/home/models/pokemon_card_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<PokemonCard> _pokemonCards = [];

  List<PokemonCard> get pokemonCards => _pokemonCards;

  String get deckSizeLabel =>
      'Standard deck size: ${DeckConstants.standardDeckSize} cards';

  HomeViewModel() {
    _loadInitialCards();
  }

  void _loadInitialCards() {
    // In a real app, this would load from a service
    _pokemonCards = List.generate(
      5,
      (index) => PokemonCard.mock(),
    );
    notifyListeners();
  }

  void onSwipeLeft(PokemonCard card) {
    _pokemonCards = _pokemonCards.where((c) => c.id != card.id).toList();
    notifyListeners();
  }

  void onSwipeRight(PokemonCard card) {
    _pokemonCards = _pokemonCards.where((c) => c.id != card.id).toList();
    notifyListeners();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Pokémon Deck Rules',
      description:
          'A standard Pokémon deck must contain exactly ${DeckConstants.standardDeckSize} cards, '
          'with a maximum of ${DeckConstants.maxCopiesOfSameCard} copies of any individual card.',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Deck Composition Rules',
      description: 'Maximum cards per type:\n'
          '• Pokémon: ${DeckConstants.maxPokemonCards}\n'
          '• Energy: ${DeckConstants.maxEnergyCards}\n'
          '• Trainer: ${DeckConstants.maxTrainerCards}',
    );
  }
}
