import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemstore_ecommerce/models/category_response.dart';
import 'package:gemstore_ecommerce/repository/category_repository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      try {
        emit(CategoryLoading());

        CategoryResponse categoryResponse = await categoryRepository.getAllCategory();
        emit(CategoryLoaded(categoryResponse));

      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }
}
