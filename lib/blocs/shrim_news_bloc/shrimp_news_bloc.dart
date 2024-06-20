import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/blocs/shrim_news_bloc/shrimp_news_status.dart';
import 'package:jala_test/blocs/shrim_price_bloc/shrimp_price_status.dart';
import 'package:jala_test/data/model/shrimp_news_model.dart';
import 'package:jala_test/data/remote/service/shrimp_news_service.dart';

part 'shrimp_news_event.dart';
part 'shrimp_news_state.dart';

class ShrimpNewsBloc extends Bloc<ShrimpNewsEvent, ShrimpNewsState> {
  var sizeFilter = "";
  var regionId = "";
  ShrimpNewsBloc() : super(const ShrimpNewsState()) {
    on<ShrimpNewsFetch>(
      _onTodoFetch,
      transformer: droppable(),
    );

    // Refresh Event
    on<ShrimpNewsRefresh>(
      _onShrimpNewsRefresh,
      transformer: droppable(),
    );
  }

  final ShrimpNewsService _todoService = ShrimpNewsService.instance;
  var page = 1;

  FutureOr<void> _onTodoFetch(
      ShrimpNewsFetch event, Emitter<ShrimpNewsState> emit) async {
    try {
      if (state.hasReachedMax) return;
      if (state.status == ShrimpNewsStatus.initial) {
        final data = await _todoService.fetchTodos();
        return emit(
          state.copyWith(
            data: data.data,
            hasReachedMax: false,
            status: ShrimpNewsStatus.success,
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
              ..addAll(data.data as Iterable<ShrimpNewsData>),
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      return emit(state.copyWith(status: ShrimpNewsStatus.error));
    }
  }

  FutureOr<void> _onShrimpNewsRefresh(
      ShrimpNewsRefresh event, Emitter<ShrimpNewsState> emit) async {
    page = 0;
    emit(const ShrimpNewsState());
    await Future.delayed(const Duration(seconds: 1));
    add(const ShrimpNewsFetch());
  }
}
