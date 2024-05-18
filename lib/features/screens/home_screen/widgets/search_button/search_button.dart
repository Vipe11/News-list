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

  @override
  Widget build(BuildContext context) {
    // Search callback
    void searchNewsWithTag() {
      if (controller.text.isNotEmpty) {
        context.read<NewsListBloc>().add(
              NewsListEvent.searchFromTag(tag: controller.text),
            );
        Navigator.of(context).pop();
        controller.clear();
      }
    }

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
                  const TapTagListView(),
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
  }
}
