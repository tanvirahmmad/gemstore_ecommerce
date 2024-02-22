part of 'heels_products_bloc.dart';

@immutable
abstract class HeelsProductsState extends Equatable {}

class HeelsProductsInitial extends HeelsProductsState {
@override

List<Object?> get props =>[] ;
}

class HeelsProductsLoading extends HeelsProductsState {
  @override
  List<Object?> get props => [];
}

class HeelsProductsLoaded extends HeelsProductsState {
  late final ProductResponse heelsproductResponse;
  HeelsProductsLoaded(this.heelsproductResponse);
  @override
  List<Object?> get props => [heelsproductResponse];
}

class HeelsProductsError extends HeelsProductsState {
  final String error;
  HeelsProductsError(this.error);
  @override
  List<Object?> get props => [error];
}
