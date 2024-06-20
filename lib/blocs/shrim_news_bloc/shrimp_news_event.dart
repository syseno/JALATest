part of 'shrimp_news_bloc.dart';

@immutable
abstract class ShrimpNewsEvent extends Equatable {
  const ShrimpNewsEvent();
  @override
  List<Object?> get props => [];
}


class ShrimpNewsFetch extends ShrimpNewsEvent {
  const ShrimpNewsFetch();
}

class ShrimpNewsRefresh extends ShrimpNewsEvent {
  const ShrimpNewsRefresh();
}