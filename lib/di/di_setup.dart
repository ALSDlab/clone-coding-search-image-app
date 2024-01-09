import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/domain/image_repository_impl/image_repository_impl.dart';
import 'package:clone_coding_image_search_app/ui/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageRepository>(ImageRepositoryImpl());
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(repository: getIt<ImageRepository>()));
}
