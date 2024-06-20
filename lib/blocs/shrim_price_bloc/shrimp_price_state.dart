part of 'shrimp_price_bloc.dart';

class ShrimpPriceState extends Equatable{

  final List<ShrimpPriceData> data;
  final bool hasReachedMax;
  final ShrimpPriceStatus status;

  const ShrimpPriceState({
    this.data = const <ShrimpPriceData>[],
    this.hasReachedMax = false,
    this.status = ShrimpPriceStatus.initial
  });

  ShrimpPriceState copyWith({
    List<ShrimpPriceData>? data,
    bool? hasReachedMax,
    ShrimpPriceStatus? status,
  }) {
    return ShrimpPriceState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, hasReachedMax, status];
}