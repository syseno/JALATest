import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/blocs/shrimp_ill_bloc/shrimp_ill_status.dart';

import '../../data/model/shrimp_ill_model.dart';
import '../../data/remote/service/shrimp_ill_service.dart';

part 'shrimp_ill_event.dart';
part 'shrimp_ill_state.dart';

class ShrimpIllBloc extends Bloc<ShrimpIllEvent, ShrimpIllState> {
  var sizeFilter = "";
  var regionId = "";
  ShrimpIllBloc() : super(const ShrimpIllState()) {
    on<ShrimpIllFetch>(
      _onTodoFetch,
      transformer: droppable(),
    );

    // Refresh Event
    on<ShrimpIllRefresh>(
      _onShrimpIllRefresh,
      transformer: droppable(),
    );
  }

  final ShrimpIllService _todoService = ShrimpIllService.instance;
  var page = 1;

  FutureOr<void> _onTodoFetch(
      ShrimpIllFetch event, Emitter<ShrimpIllState> emit) async {
    try {
      if (state.hasReachedMax) return;
      if (state.status == ShrimpIllStatus.initial) {
        final data = await _todoService.fetchTodos();
        return emit(
          state.copyWith(
            data: data.data,
            hasReachedMax: false,
            status: ShrimpIllStatus.success,
          ),
        );
      }
      page += 1;
      final data = await _todoService.fetchTodos(page);
      if (data.data?.isEmpty == true) {
        return emit(state.copyWith(hasReachedMax: true));
      } else {
        return emit(
          state.copyWith(
            data: List.of(state.data)
              ..addAll(data.data as Iterable<ShrimpIllData>),
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      return emit(state.copyWith(status: ShrimpIllStatus.error));
    }
  }

  FutureOr<void> _onShrimpIllRefresh(
      ShrimpIllRefresh event, Emitter<ShrimpIllState> emit) async {
    page = 0;
    emit(const ShrimpIllState());
    await Future.delayed(const Duration(seconds: 1));
    add(const ShrimpIllFetch());
  }
}
