part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetAllCategory extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
