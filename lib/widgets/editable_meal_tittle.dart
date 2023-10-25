import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';


class EditableMealTitle extends ConsumerStatefulWidget {
  final String mealId;

  EditableMealTitle({super.key, required this.mealId});

  @override
  ConsumerState<EditableMealTitle> createState() => _EditableMealTitleState();
}

class _EditableMealTitleState extends ConsumerState<EditableMealTitle> {
  final textEditingController = TextEditingController();

  void submitTitle() {
    ref
        .read(mealsProvider.notifier)
        .renameMeal(widget.mealId, textEditingController.text);
    Navigator.pop(context);
  }

  void showEditDialog(String mealTitle) {
    textEditingController.text = mealTitle;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Theme.of(dialogContext).colorScheme.onBackground),
        title: const Text('Rename meal title'),
        icon: const Icon(Icons.edit),
        content: TextField(
          controller: textEditingController,
          style: TextStyle(
              color: Theme.of(dialogContext).colorScheme.onBackground),
          onSubmitted: (_) {
            submitTitle();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('cancel'),
          ),
          ElevatedButton(
            onPressed: submitTitle,
            child: const Text('apply'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(mealsProvider);
    final meal = ref.read(mealsProvider.notifier).getMeal(widget.mealId);
    return GestureDetector(
      onTap: () {
        showEditDialog(meal.title);
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(5),
        child: Text(meal.title),
      ),
    );
  }
}
