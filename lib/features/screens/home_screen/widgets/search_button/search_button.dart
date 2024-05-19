import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_list/features/screens/home_screen/bloc/bloc/news_list_bloc.dart';
import 'package:news_list/features/screens/home_screen/widgets/widgets.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final TextEditingController controller = TextEditingController();
  String currentTag = 'all';

  @override
  Widget build(BuildContext context) {
    // Search callback
    void searchNewsWithTag() {
      if (controller.text.isNotEmpty &&
          controller.text.toLowerCase() != currentTag.toLowerCase()) {
        context.read<NewsListBloc>().add(
              NewsListEvent.loadNews(tag: controller.text),
            );
        Navigator.of(context).pop();
        controller.clear();
      }
    }

    return BlocConsumer<NewsListBloc, NewsListState>(
      listener: (context, state) {
        state.maybeWhen(
            loaded: (newsList, tag, limit) {
              currentTag = tag ?? 'all';
            },
            orElse: () {});
      },
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TapTagListView(
                        currentTag: currentTag,
                      ),
                      const SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Type your search',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            searchNewsWithTag();
                          },
                          child: const Text('Search'))
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ));
      },
    );
  }
}
