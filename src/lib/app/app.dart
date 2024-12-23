import 'package:pokemon_deck/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:pokemon_deck/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:pokemon_deck/features/home/home_view.dart';
import 'package:pokemon_deck/features/startup/startup_view.dart';
import 'package:pokemon_deck/features/home/services/deck_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DeckService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
