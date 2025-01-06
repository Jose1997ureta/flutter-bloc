import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import "package:uuid/uuid.dart";

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });

    on<AddGuests>(_addGuestHandler);
    on<ToggleGuests>(_toggleGuestHanlder);
  }

  void changeFilter(GuestsFilter value) {
    add(SetCustomFilterEvent(value));
  }

  void adGuest(String name) {
    add(AddGuests(name));
  }

  void toggleGuests(String id) {
    add(ToggleGuests(id));
  }

  void _addGuestHandler(AddGuests event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);

    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHanlder(ToggleGuests event, Emitter<GuestsState> emit) {
    final updateGuests = state.guests.map((el) {
      if (el.id == event.id) {
        return el.copyWith(
            completedAt: el.completedAt == null ? DateTime.now() : null);
      }

      return el;
    }).toList();

    emit(state.copyWith(guests: updateGuests));
  }
}
