import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/error/failure_localizer.dart';
import 'package:budget/core/validation/form_validators.dart';
import 'package:budget/features/auth/presentation/widgets/auth_button.dart';
import 'package:budget/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:budget/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:budget/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:budget/features/profile/presentation/widgets/profile_edit_avatar_picker.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _imagePicker = ImagePicker();
  bool _controllersBound = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _bindControllersIfNeeded(EditProfileReady ready) {
    if (_controllersBound) return;
    _nameController.text = ready.user.name;
    _emailController.text = ready.user.email;
    _controllersBound = true;
  }

  Future<void> _pickImage(EditProfileCubit cubit) async {
    final file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (!mounted || file == null) return;
    cubit.setPickedImagePath(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listenWhen: (previous, current) {
        if (current is EditProfileSuccess) return true;
        if (current is EditProfileNoSession) return true;
        if (current is EditProfileReady &&
            current.errorMessage != null &&
            previous is EditProfileReady &&
            previous.isSaving &&
            !current.isSaving) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.edit_profile_success,
                style: AppStyles.body1.copyWith(color: AppColors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
          context.pop();
        } else if (state is EditProfileNoSession) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                l10n.edit_profile_not_signed_in,
                style: AppStyles.body1.copyWith(color: AppColors.white),
              ),
              backgroundColor: Colors.red.shade700,
            ),
          );
          context.pop();
        } else if (state is EditProfileReady && state.errorMessage != null) {
          final raw = state.errorMessage!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FailureLocalizer.localize(raw, context),
                style: AppStyles.body1.copyWith(color: AppColors.white),
              ),
              backgroundColor: Colors.red.shade700,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading || state is EditProfileInitial) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(l10n.edit_profile, style: AppStyles.body2ExtraBold),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is! EditProfileReady) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(l10n.edit_profile, style: AppStyles.body2ExtraBold),
            ),
            body: const SizedBox.shrink(),
          );
        }

        final ready = state;
        _bindControllersIfNeeded(ready);
        final cubit = context.read<EditProfileCubit>();

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: AppColors.primary,
              onPressed: () => context.pop(),
            ),
            title: Text(
              l10n.edit_profile,
              style: AppStyles.body2ExtraBold,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ProfileEditAvatarPicker(
                        networkImageUrl: ready.user.profileImage,
                        localImagePath: ready.pickedImagePath,
                        onPickPressed: () => _pickImage(cubit),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    AuthTextField(
                      label: l10n.email,
                      hint: l10n.email_hint,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      textDirection: TextDirection.ltr,
                      validator: (v) {
                        final t = v?.trim() ?? '';
                        if (t.isEmpty) return l10n.field_required;
                        if (!FormValidators.isValidEmail(t)) {
                          return l10n.invalid_email;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 18.h),
                    AuthTextField(
                      label: l10n.full_name,
                      hint: l10n.full_name_hint,
                      controller: _nameController,
                      validator: (v) {
                        final t = v?.trim() ?? '';
                        if (t.isEmpty) return l10n.field_required;
                        if (!FormValidators.hasMinTrimmedLength(t, 2)) {
                          return l10n.field_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32.h),
                    AuthButton(
                      text: l10n.update_profile_action,
                      isLoading: ready.isSaving,
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        cubit.submit(
                          name: _nameController.text,
                          email: _emailController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
