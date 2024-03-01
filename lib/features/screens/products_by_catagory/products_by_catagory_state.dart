part of 'products_by_catagory_bloc.dart';

@immutable
abstract class ProductsByCatagoryState extends Equatable{}

class ProductsByCatagoryInitial extends ProductsByCatagoryState {
  @override

  List<Object?> get props => [];
}
class ProductsByCatagoryLoading extends ProductsByCatagoryState {
  @override
  List<Object> get props => [];
}

class ProductsByCatagoryLoaded extends ProductsByCatagoryState  {
  final ProductResponse getproductsbycatagoryResponse;

  ProductsByCatagoryLoaded(this.getproductsbycatagoryResponse);

  @override
  List<Object> get props => [getproductsbycatagoryResponse];
}

class ProductsByCatagoryError extends ProductsByCatagoryState {
  final String error;

  ProductsByCatagoryError(this.error);

  @override
  List<Object> get props => [error];
}
