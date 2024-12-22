import 'package:pokemon_deck/features/card_detail/card_detail_view.dart';
import 'package:pokemon_deck/services/pokemon_service.dart';
import 'package:pokemon_deck/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:pokemon_deck/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:pokemon_deck/features/home/home_view.dart';
import 'package:pokemon_deck/features/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CardDetailView),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PokemonService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
