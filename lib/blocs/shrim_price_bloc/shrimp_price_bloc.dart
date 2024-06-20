import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/blocs/shrim_price_bloc/shrimp_price_status.dart';
import 'package:jala_test/data/model/shrimp_price_model.dart';
import 'package:jala_test/data/remote/service/shrimp_price_service.dart';

part 'shrimp_price_event.dart';
part 'shrimp_price_state.dart';

class ShrimpPriceBloc extends Bloc<ShrimpPriceEvent, ShrimpPriceState> {
  var sizeFilter = "";
  var regionId = "";
  ShrimpPriceBloc() : super(const ShrimpPriceState()) {
    on<ShrimpPriceFetch>(
      _onTodoFetch,
      transformer: droppable(),
    );

    // Refresh Event
    on<ShrimpPriceRefresh>(
      _onShrimpPriceRefresh,
      transformer: droppable(),
    );
  }

  final ShrimpPriceService _todoService = ShrimpPriceService.instance;
  var page = 1;

  FutureOr<void> _onTodoFetch(
      ShrimpPriceFetch event, Emitter<ShrimpPriceState> emit) async {
    try {
      if (state.hasReachedMax) return;
      if (state.status == ShrimpPriceStatus.initial) {
        final data = await _todoService.fetchTodos();
        return emit(
          state.copyWith(
            data: data.data,
            hasReachedMax: false,
            status: ShrimpPriceStatus.success,
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
              ..addAll(data.data as Iterable<ShrimpPriceData>),
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      return emit(state.copyWith(status: ShrimpPriceStatus.error));
    }
  }

  FutureOr<void> _onShrimpPriceRefresh(
      ShrimpPriceRefresh event, Emitter<ShrimpPriceState> emit) async {
    page = 0;
    emit(const ShrimpPriceState());
    await Future.delayed(const Duration(seconds: 1));
    add(const ShrimpPriceFetch());
  }
}
