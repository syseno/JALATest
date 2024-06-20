part of 'shrimp_ill_bloc.dart';

@immutable
abstract class ShrimpIllEvent extends Equatable {
  const ShrimpIllEvent();
  @override
  List<Object?> get props => [];
}


class ShrimpIllFetch extends ShrimpIllEvent {
  const ShrimpIllFetch();
}

class ShrimpIllRefresh extends ShrimpIllEvent {
  const ShrimpIllRefresh();
}