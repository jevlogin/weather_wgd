import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather_wgd/blocs/weather/weather_bloc.dart';
import 'package:weather_wgd/generated/l10n.dart';
import 'package:weather_wgd/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

GetIt getIt = GetIt.instance;
final talker = TalkerFlutter.init();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton(talker);
  GetIt.I<Talker>().info('App started with Talker');

  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
          printEventFullData: false, printStateFullData: false));

  FlutterError.onError =
      (details) => talker.handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MyApp()),
      (error, stack) => talker.handle(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade300),
        useMaterial3: true,
      ),
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
      home: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snap) {
          if (snap.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) =>
                  WeatherBloc()..add(FetchWeatherEvent(snap.data as Position)),
              child: const HomeScreen(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  GetIt.I<Talker>().info('Location services started');

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    var serviceDisabled = 'Location services are disabled.';
    GetIt.I<Talker>().error(serviceDisabled);
    return Future.error(serviceDisabled);
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      var denied = 'Location permissions are denied';
      GetIt.I<Talker>().error(denied);
      return Future.error(denied);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    var deniedForever = 'Location permissions are permanently denied, we cannot request permissions.';
    GetIt.I<Talker>().error(deniedForever);
    return Future.error(deniedForever);
  }

  var position = await Geolocator.getCurrentPosition();
  GetIt.I<Talker>().info('Location services enabled, position = $position');
  return position;
}