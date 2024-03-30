import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttertestux/blocs/category/category_event.dart';
import 'package:fluttertestux/blocs/category/category_state.dart';
import 'package:fluttertestux/models/category_model.dart';
import 'package:fluttertestux/repositories/category/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_mapLoadCategoriesToState);
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  void _mapLoadCategoriesToState(LoadCategories event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading()); // Emitir o estado de carregamento enquanto busca as categorias
      final categoriesStream = _categoryRepository.getAllCategories();
      final categories = await categoriesStream.first; // Obter a primeira lista de categorias da stream
      emit(CategoryLoaded(categories: categories)); // Emitir o estado CategoryLoaded com a lista de categorias
    } catch (e) {
      emit(CategoryError(message: 'Failed to load categories: $e'));
    }
  }


  Stream<CategoryState> _mapUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
