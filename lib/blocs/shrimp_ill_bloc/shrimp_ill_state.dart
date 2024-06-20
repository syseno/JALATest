part of 'shrimp_ill_bloc.dart';

class ShrimpIllState extends Equatable {
  final List<ShrimpIllData> data;
  final bool hasReachedMax;
  final ShrimpIllStatus status;

  const ShrimpIllState(
      {this.data = const <ShrimpIllData>[],
      this.hasReachedMax = false,
      this.status = ShrimpIllStatus.initial});

  ShrimpIllState copyWith({
    List<ShrimpIllData>? data,
    bool? hasReachedMax,
    ShrimpIllStatus? status,
  }) {
    return ShrimpIllState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, hasReachedMax, status];
}
