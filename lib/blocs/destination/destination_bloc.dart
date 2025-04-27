import 'package:flutter_bloc/flutter_bloc.dart';
import 'destination_event.dart';
import 'destination_state.dart';
import '../../repositories/destination_repository.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  final DestinationRepository repository;

  DestinationBloc(this.repository) : super(DestinationInitial()) {
    on<LoadDestinations>((event, emit) async {
      emit(DestinationLoading());
      try {
        final destinations = await repository.fetchDestinations();
        emit(DestinationLoaded(destinations));
      } catch (e) {
        emit(DestinationError('Failed to fetch destinations'));
      }
    });
  }
}
