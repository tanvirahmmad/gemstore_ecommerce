part of 'flats_products_bloc.dart';

@immutable
abstract class FlatsProductsState extends Equatable{}

class FlatsProductsInitial extends FlatsProductsState {
  @override
  List<Object?> get props => [];
}
class FlatsProductsLoading extends FlatsProductsState {
  @override
  List<Object?> get props => [];
}

class FlatsProductsLoaded extends FlatsProductsState {
  late final ProductResponse flatsproductResponse;
  FlatsProductsLoaded(this.flatsproductResponse);
  @override
  List<Object?> get props => [flatsproductResponse];
}

class FlatsProductsError extends FlatsProductsState {
  final String error;
  FlatsProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
