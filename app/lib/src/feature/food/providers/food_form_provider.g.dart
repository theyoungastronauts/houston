// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_form_provider.dart';

// **************************************************************************
// FormProviderGenerator
// **************************************************************************

class HoustonFoodFormProvider extends StateNotifier<Food> {
  final Ref ref;
  final String uuid;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool changesMade = false;

  HoustonFoodFormProvider(this.ref, this.uuid, Food initialState)
      : super(initialState) {
    load(uuid);
    fieldListeners();
  }

  void load(String uuid) async {
    if (uuid.isNotEmpty && uuid != "new") {
      final food = await FoodDbService().retrieve(uuid: uuid);
      if (food != null) {
        state = food;
      } else {
        handleEmpty();
      }
    } else {
      handleEmpty();
    }

    setFields();
    changesMade = false;
  }

  void handleEmpty() {
    state = Food.empty();
  }

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(
          title: "Are you sure you want to discard all unsaved changes?");

      if (confirmed != true) {
        return false;
      }
    }
    clear();
    return true;
  }

  void clear() {
    handleEmpty();
    clearFields();
  }

  Future<bool?> delete() async {
    final confirmed = await ConfirmDialog.show(
      title: 'Are you sure you want to delete this Food?',
      destructive: true,
    );

    if (confirmed == true) {
      ref.read(globalLoadingProvider.notifier).start();
      final success = await FoodDbService().delete(state);
      ref.read(globalLoadingProvider.notifier).complete();

      if (success) {
        ref.read(foodListProvider.notifier).refresh();
        Toast.message("Food deleted.");
        return true;
      } else {
        Toast.error();
        return false;
      }
    }
    return null;
  }

  bool additionalValidation() {
    return true;
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (!additionalValidation()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final food = await FoodDbService().save(state);

    if (food != null) {
      state = food;
      ref.read(foodListProvider.notifier).refresh();
      ref.invalidate(foodDetailProvider(food.uuid));
      ref.read(globalLoadingProvider.notifier).complete();
      return true;
    }

    ref.read(globalLoadingProvider.notifier).complete();
    return false;
  }

  void fieldListeners() {}
  void setFields() {}
  void clearFields() {}
}
