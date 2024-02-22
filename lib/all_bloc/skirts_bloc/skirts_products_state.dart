part of 'skirts_products_bloc.dart';

@immutable
abstract class SkirtsProductsState extends Equatable {}

class SkirtsProductsInitial extends SkirtsProductsState {
  @override
  List<Object?> get props => [];
}

class SkirtsProductsLoading extends SkirtsProductsState {
  @override
  List<Object?> get props => [];
}

class SkirtsProductsLoaded extends SkirtsProductsState {
  late final ProductResponse skirtsproductResponse;
  SkirtsProductsLoaded(this.skirtsproductResponse);
  @override
  List<Object?> get props => [skirtsproductResponse];
}

class SkirtsProductsError extends SkirtsProductsState {
  final String error;
  SkirtsProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
