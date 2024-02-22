part of 'get_all_products_bloc.dart';

@immutable
abstract class GetAllProductsState extends Equatable {}

class GetAllProductsInitial extends GetAllProductsState {
  @override
  List<Object?> get props => [];
}

class GetAllProductsLoading extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

class GetAllProductsLoaded extends GetAllProductsState {
  final ProductResponse getallproductResponse;

   GetAllProductsLoaded(this.getallproductResponse);

  @override
  List<Object> get props => [getallproductResponse];
}

class GetAllProductsError extends GetAllProductsState {
  final String error;

   GetAllProductsError(this.error);

  @override
  List<Object> get props => [error];
}
