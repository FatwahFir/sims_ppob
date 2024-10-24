import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sims_ppob/app/shared/components/custom_snackbar.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/my_strings.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

// ignore: must_be_immutable
class AvatarField extends StatefulWidget {
  Function(File) onChange;
  String? networkImage;
  bool? isShowEditBtn;
  AvatarField({
    super.key,
    required this.onChange,
    this.networkImage,
    this.isShowEditBtn = true,
  });

  @override
  State<AvatarField> createState() => _AvatarFieldState();
}

class _AvatarFieldState extends State<AvatarField> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Themes.white,
          backgroundImage: _image != null
              ? FileImage(File(_image!.path)) as ImageProvider<Object>?
              : widget.networkImage != null
                  ? CachedNetworkImageProvider(
                      widget.networkImage!,
                      errorListener: (_) {
                        setState(() {
                          widget.networkImage = null;
                        });
                      },
                    )
                  : const AssetImage(MyPath.profileImage),
        ),
        widget.isShowEditBtn!
            ? Positioned(
                right: 0,
                bottom: -3,
                child: Container(
                  width: 30,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Themes.white,
                      border: Border.all(color: Themes.grayColor, width: 0.5)),
                  child: IconButton(
                    iconSize: 15,
                    color: Themes.grayColor.withOpacity(0.8),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (image != null) {
                        final String fileExtension =
                            image.path.split('.').last.toLowerCase();
                        if (fileExtension != 'jpg' &&
                            fileExtension != 'jpeg' &&
                            fileExtension != 'png') {
                          CustomSnackBar.error(
                              errorList: [MyStrings.mustBeJPG]);
                          return;
                        }

                        final File file = File(image.path);
                        final int fileSize = await file.length();
                        const int maxFileSize = 100 * 1024;

                        if (fileSize > maxFileSize) {
                          CustomSnackBar.error(
                              errorList: [MyStrings.lessThan100kb]);

                          return;
                        }

                        if (!mounted) return;

                        setState(() {
                          _image = image;
                        });

                        widget.onChange(file);
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Themes.dark20,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
