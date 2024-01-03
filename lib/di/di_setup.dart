import 'package:clone_coding_image_search_app/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/repository/image_repository_impl.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageRepository>(ImageModelsRepositoryImpl());

  getIt.registerFactory<ImageViewModel>(
      () => ImageViewModel(repository: getIt<ImageRepository>()));
}
