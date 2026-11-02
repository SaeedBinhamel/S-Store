import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Products/Domain/UseCases/get_products.dart';
import 'package:get_it/get_it.dart';
import '../../Features/Products/Data/Datasource/product_data_sources.dart';
import '../../Features/Products/Data/Repositories_Implementation/product_repository_imp.dart';
import '../../Features/Products/Domain/Repositories/product_repository.dart';
import '../../Features/Products/Presentation/Bloc/product_bloc/product_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  //Product Data Source
  getIt.registerLazySingleton<ProductDataSources>(
    () => ProductDataSources(),
  ); //ينشئ كائنًا واحدًا عند أول طلب، ثم يعيد استخدامه.

  //Product Repository Implementation with repo
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(getIt<ProductDataSources>()),
  ); //ينشئ كائنًا واحدًا عند أول طلب، ثم يعيد استخدامه.

  //Product Repository
  getIt.registerLazySingleton<GetProducts>(
    //ينشئ كائنًا واحدًا عند أول طلب، ثم يعيد استخدامه.
    () => GetProducts(getIt<ProductRepository>()),
  );

  //Product Bloc
  getIt.registerFactory<ProductBloc>(
    //	ينشئ كائنًا جديدًا في كل مرة تطلبه.
    () => ProductBloc(getIt<GetProducts>()),
  );

  // Cart Cubit
  getIt.registerLazySingleton<CartCubit>(
    //ينشئ كائنًا واحدًا عند أول طلب، ثم يعيد استخدامه.
    () => CartCubit(),
  );
}
