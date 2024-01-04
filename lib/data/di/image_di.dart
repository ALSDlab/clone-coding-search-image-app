import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository_impl.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_viewmodel.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void diSetup(){
  getIt.registerSingleton<ImageRepository>(ImageRepositoryImpl());
  getIt.registerFactory<ImageViewmodel>(() => ImageViewmodel(repository: getIt<ImageRepository>()));
}

