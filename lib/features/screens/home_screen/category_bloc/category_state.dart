part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final CategoryResponse categoryResponse;

  const CategoryLoaded(this.categoryResponse);

  @override
  List<Object> get props => [];
}

class CategoryError extends CategoryState {
  final String error;

  const CategoryError(this.error);

  @override
  List<Object> get props => [];
}
