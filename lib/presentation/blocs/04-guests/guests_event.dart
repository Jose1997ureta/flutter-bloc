part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class SetAllFilterEvent extends GuestsEvent {}

final class SetInvitedFilterEvent extends GuestsEvent {}

final class SetNoInvitedFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestsFilter newFilter;

  const SetCustomFilterEvent(this.newFilter);
}

final class AddGuests extends GuestsEvent {
  final String name;
  const AddGuests(this.name);
}

final class ToggleGuests extends GuestsEvent {
  final String id;
  const ToggleGuests(this.id);
}
