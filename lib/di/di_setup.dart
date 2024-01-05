import 'package:clone_coding_image_search_app/data/data_source/image_api.dart';
import 'package:clone_coding_image_search_app/domain/repository/image_item_repository.dart';
import 'package:clone_coding_image_search_app/data/repository/image_item_repository_impl.dart';
import 'package:clone_coding_image_search_app/ui/main/main_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup(){
  getIt.registerSingleton<ImageApi>(ImageApi());
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl(api: getIt<ImageApi>()));
  getIt.registerFactory(() => MainViewmodel(imageItemRepository: getIt<ImageItemRepository>()));

}