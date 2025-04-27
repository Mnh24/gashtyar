import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FlightSearchPage.dart';
import 'HomeScreen.dart';

import 'repositories/destination_repository.dart';
import 'blocs/destination/destination_bloc.dart';
import 'blocs/destination/destination_event.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DestinationBloc>(
          create:
              (context) =>
                  DestinationBloc(DestinationRepository())
                    ..add(LoadDestinations()),
        ),
        // 👆 Later if you have more BLoCs, just add them here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
