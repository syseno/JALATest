part of 'shrimp_price_bloc.dart';

@immutable
abstract class ShrimpPriceEvent extends Equatable {
  const ShrimpPriceEvent();
  @override
  List<Object?> get props => [];
}


class ShrimpPriceFetch extends ShrimpPriceEvent {
  const ShrimpPriceFetch();
}

class ShrimpPriceRefresh extends ShrimpPriceEvent {
  const ShrimpPriceRefresh();
}