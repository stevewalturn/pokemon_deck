import 'package:pokemon_deck/app/app.bottomsheets.dart';
import 'package:pokemon_deck/app/app.dialogs.dart';
import 'package:pokemon_deck/app/app.locator.dart';
import 'package:pokemon_deck/app/app.router.dart';
import 'package:pokemon_deck/features/home/home_repository.dart';
import 'package:pokemon_deck/models/pokemon_card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _homeRepository = HomeRepository();

  List<PokemonCard> _cards = [];
  List<PokemonCard> get cards => _cards;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> initialize() async {
    await loadCards();
  }

  Future<void> loadCards() async {
    try {
      setBusy(true);
      _errorMessage = null;
      _cards = await _homeRepository.getCards();
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

  Future<void> removeCard(String id) async {
    try {
      setBusy(true);
      await _homeRepository.removeCard(id);
      await loadCards();
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

  void navigateToCardDetail(String cardId) {
    _navigationService.navigateToCardDetailView(cardId: cardId);
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Welcome to Pokemon Deck',
      description: 'Your virtual collection of Pokemon cards!',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Pokemon Deck',
      description: 'Manage your Pokemon card collection',
    );
  }
}
