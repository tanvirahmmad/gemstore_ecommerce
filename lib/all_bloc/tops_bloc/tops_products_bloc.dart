import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/tops_repository.dart';
import 'package:meta/meta.dart';

part 'tops_products_event.dart';
part 'tops_products_state.dart';

class TopsProductsBloc extends Bloc<TopsProductsEvent, TopsProductsState> {
  final TopsProductsRepository topsProductsRepository;

  TopsProductsBloc(this.topsProductsRepository) : super(TopsProductsInitial()) {
    on<TopsProductsEvent>((event, emit) async {
      try {
        emit(TopsProductsLoading());
        ProductResponse topsproductResponse =
            await topsProductsRepository.getTopsProducts();
        emit(TopsProductsLoaded(topsproductResponse));
      } catch (e) {
        emit(TopsProductsError(e.toString()));
      }
    });
  }
}
