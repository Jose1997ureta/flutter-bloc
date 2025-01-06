import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import "package:uuid/uuid.dart";

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestsFilter.all));
    // });

    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestsFilter.invited));
    // });

    // on<SetNoInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestsFilter.noInvited));
    // });

    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }

  void changeFilter(GuestsFilter value) {
    add(SetCustomFilterEvent(value));
  }

  // void changeFilter(GuestsFilter newFilter) {
  //   switch (newFilter) {
  //     case GuestsFilter.all:
  //       add(SetAllFilterEvent());
  //       break;
  //     case GuestsFilter.invited:
  //       add(SetInvitedFilterEvent());
  //       break;
  //     case GuestsFilter.noInvited:
  //       add(SetNoInvitedFilterEvent());
  //       break;
  //   }
  // }
}
