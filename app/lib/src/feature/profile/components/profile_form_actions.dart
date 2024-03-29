import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme.dart';
import '../../../core/utils/toast.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../providers/profile_form_provider.dart';

class ProfileFormActions extends BaseComponent {
  final String uuid;
  const ProfileFormActions({
    super.key,
    required this.uuid,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileFormProvider(uuid).notifier);
    final model = ref.watch(profileFormProvider(uuid));

    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              variant: AppColorVariant.light,
              type: AppButtonType.Text,
              onPressed: () async {
                final confirmed = await provider.discard();
                if (confirmed) {
                  if (context.mounted) {
                    context.pop();
                  }
                }
              },
            ),
            Row(
              children: [
                if (model.exists)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AppButton(
                      label: "Delete",
                      variant: AppColorVariant.danger,
                      onPressed: () async {
                        final success = await provider.delete();
                        if (success == true) {
                          if (context.mounted) {
                            context.pop();
                            context.pop();
                          }
                        }
                      },
                    ),
                  ),
                AppButton(
                  label: "Save",
                  variant: AppColorVariant.success,
                  onPressed: () async {
                    final success = await provider.submit();
                    if (success == true) {
                      if (context.mounted) {
                        context.pop();
                      }
                      Toast.message("Profile saved successfully!");
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
