import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_teller/state_managers/app_state_manager.dart';
import 'package:story_teller/state_managers/shared_prefs.dart';
import 'package:story_teller/story_teller_theme.dart';
import 'components/components.dart';
import 'constants/ui.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';
import 'screens/home.dart';
import 'services/service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _sharedPrefs = SharedPrefs();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter = AppRouter(sharedPrefs: _sharedPrefs);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<List<StoryCharacter>>(
        //     create: (context) => _sharedPrefs.getCategories()),
        // Provider<bool>(create: (context) => _sharedPrefs.darkMode),
        ChangeNotifierProvider(create: (context) => _sharedPrefs),
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: Consumer<SharedPrefs>(
        builder: (context, sharedPrefs, child) {
          print("main" + SharedPrefs().darkMode.toString());
          ThemeData theme;
          if (sharedPrefs.darkMode) {
            theme = StoryTellerTheme.dark();
          } else {
            theme = StoryTellerTheme.light();
          }

          var router = _appRouter.router;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: UI.appName,
            theme: theme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            // home: const Home(title: UI.title),
          );
        },
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     _categories = await this.categoryService.getCategories();
  //   });
  //}
}
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final _sharedPrefs = AppStateManager();
//   late AppRouter _appRouter;

//   @override
//   void initState() {
//     _appRouter = AppRouter(appStateManager: _sharedPrefs);
//   }

  
// }
