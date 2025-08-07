import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homecenter/features/products/domain/entities/product.dart';
import 'package:homecenter/features/products/domain/usecases/get_products.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

// throttle to avoid multiple requests
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final GetProducts _getProducts;

  ProductsListBloc(this._getProducts) : super(ProductsListInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(
        ProductsListLoading(
          state.products,
          event.page ?? state.page,
          event.q ?? state.query,
        ),
      );

      try {
        final products = await _getProducts(
          page: event.page ?? state.page,
          query: event.q ?? state.query,
        );

        emit(
          ProductsListLoaded(
            [...state.products, ...products],
            event.page ?? state.page,
            event.q ?? state.query,
          ),
        );
        print(state.products.length);
      } catch (e) {
        emit(
          ProductsListError(
            state.products,
            state.page,
            state.query,
            e.toString(),
          ),
        );
      }
    }, transformer: throttleDroppable(throttleDuration));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
