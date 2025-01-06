part of 'guests_bloc.dart';

enum GuestsFilter { all, invited, noInvited }

class GuestsState extends Equatable {
  final GuestsFilter filter;
  final List<Todo> guests;

  const GuestsState({this.filter = GuestsFilter.all, this.guests = const []});

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestsFilter.all:
        return guests;
      case GuestsFilter.invited:
        return guests.where((el) => el.done).toList();
      case GuestsFilter.noInvited:
        return guests.where((el) => !el.done).toList();
      default:
        throw Exception("Filter no soportado");
    }
  }

  int get totalFilterGuests => filteredGuests.length;

  GuestsState copyWith({
    GuestsFilter? filter,
    List<Todo>? guests,
  }) {
    return GuestsState(
        filter: filter ?? this.filter, guests: guests ?? this.guests);
  }

  @override
  List<Object> get props => [filter, guests];
}
