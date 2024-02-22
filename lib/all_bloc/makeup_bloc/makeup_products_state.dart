part of 'makeup_products_bloc.dart';

@immutable
abstract class MakeupProductsState extends Equatable {}

class MakeupProductsInitial extends MakeupProductsState {
@override
List<Object?> get props => [];
}

class MakeupProductsLoading extends MakeupProductsState {
  @override
  List<Object?> get props => [];
}

class MakeupProductsLoaded extends MakeupProductsState {
  late final ProductResponse makeupproductResponse;
  MakeupProductsLoaded(this.makeupproductResponse);
  @override
  List<Object?> get props => [makeupproductResponse];
}

class MakeupProductsError extends MakeupProductsState {
  final String error;

  MakeupProductsError(this.error);

  @override
  List<Object?> get props => [error];
}