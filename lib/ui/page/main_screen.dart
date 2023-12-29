import 'package:clone_coding_image_search_app/ui/page/view_model.dart';
import 'package:clone_coding_image_search_app/ui/widgets/image_item_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextController = TextEditingController();

  final viewModel = ViewModel();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.greenAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 4,
                      color: Colors.green,
                    ),
                  ),
                  hintText: '이미지 검색',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      await viewModel.searchImage(searchTextController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              StreamBuilder<bool>(
                initialData: false,
                stream: viewModel.loadingController,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        itemCount: viewModel.imageItems.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                        itemBuilder: (context, index) {
                          final imageItem = viewModel.imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
