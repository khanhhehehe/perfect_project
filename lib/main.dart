import 'package:camera_flutter/app.theme.dart';
import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/configs/routers/router.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/gen/dimens.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/bloc/language/language_cubit.dart';
import 'package:camera_flutter/presentation/bloc/language/language_state.dart';
import 'package:camera_flutter/presentation/bloc/main_bloc.dart';
import 'package:camera_flutter/presentation/pages/error/error.page.dart';
import 'package:camera_flutter/presentation/pages/home/home.page.dart';
import 'package:camera_flutter/presentation/pages/main.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _cameras = await availableCameras();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<LocalizationsDelegate<dynamic>> get _getLocalizationsDelegates {
    return const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  Locale? _localeResolutionCallback(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  ///test
  // final firebaseAuth = FirebaseAuth.instance;
  // @override
  // void initState() {
  //   firebaseAuth.createUserWithEmailAndPassword(email: "aaaaaaaa1@gmail.com", password: "123123123");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Dimens.init(context);
    return MultiBlocProvider(
      providers: MainBloc.allBlocs(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: getIt<AppRouters>().goRouter,
            themeMode: ThemeMode.light,
            locale: state.currentLanguage.locale,
            theme: AppTheme.lightTheme(context),

            localizationsDelegates: _getLocalizationsDelegates,
            localeResolutionCallback: _localeResolutionCallback,
            supportedLocales: const [
              Locale('vi'), // vn
              Locale('en'), // us
            ],
          );
        },
      ),
    );
  }
}

final homePageRoute = GoRoute(
    path: Pages.home,
    builder: (context, GoRouterState state) => const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _bodyPage() {
    return !controller.value.isInitialized
        ? ErrorPage(
            imagePath: Assets.images.sunny.path,
          )
        : MainPage(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
  
        body: _bodyPage());
  }
}
