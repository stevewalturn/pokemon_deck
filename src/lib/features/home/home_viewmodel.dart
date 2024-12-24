import 'package:pokemon_deck/app/app.bottomsheets.dart';
import 'package:pokemon_deck/app/app.dialogs.dart';
import 'package:pokemon_deck/app/app.locator.dart';
import 'package:pokemon_deck/features/constants/deck_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';
  String get deckSizeLabel =>
      'Standard deck size: ${DeckConstants.standardDeckSize} cards';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
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
