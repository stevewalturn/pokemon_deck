import 'package:pokemon_deck/app/app.locator.dart';
import 'package:pokemon_deck/models/pokemon_card.dart';
import 'package:pokemon_deck/services/pokemon_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CardDetailViewModel extends BaseViewModel {
  final _pokemonService = locator<PokemonService>();
  final _dialogService = locator<DialogService>();

  PokemonCard? _card;
  PokemonCard? get card => _card;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> initialize(String cardId) async {
    await loadCard(cardId);
  }

  Future<void> loadCard(String cardId) async {
    try {
      setBusy(true);
      _errorMessage = null;
      _card = await _pokemonService.getCardById(cardId);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      await _dialogService.showDialog(
        title: 'Error',
        description: _errorMessage,
      );
    } finally {
      setBusy(false);
    }
  }
}
