part of 'shrimp_news_bloc.dart';

class ShrimpNewsState extends Equatable {
  final List<ShrimpNewsData> data;
  final bool hasReachedMax;
  final ShrimpNewsStatus status;

  const ShrimpNewsState(
      {this.data = const <ShrimpNewsData>[],
      this.hasReachedMax = false,
      this.status = ShrimpNewsStatus.initial});

  ShrimpNewsState copyWith({
    List<ShrimpNewsData>? data,
    bool? hasReachedMax,
    ShrimpNewsStatus? status,
  }) {
    return ShrimpNewsState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, hasReachedMax, status];
}
