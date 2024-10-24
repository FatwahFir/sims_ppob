import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/consts/path.dart';

// ignore: must_be_immutable
class AvatarField extends StatefulWidget {
  Function(File) onChange;
  String? networkImage;
  AvatarField({
    super.key,
    required this.onChange,
    this.networkImage,
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
        Positioned(
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
              onPressed: showBottomSheet,
              icon: Icon(
                Icons.edit,
                color: Themes.dark20,
              ),
            ),
          ),
        )
      ],
    );
  }

  showBottomSheet() {
    Get.bottomSheet(Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
        minHeight: 100,
        maxWidth: double.infinity,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pilih Sumber Gambar',
            style:
                Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: Text(
              'Camera',
              style: Get.textTheme.bodyMedium,
            ),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(
                source: ImageSource.camera,
                imageQuality: 80,
                maxWidth: 800,
                maxHeight: 800,
              );
              if (image != null) {
                setState(() {
                  _image = image;
                });
                widget.onChange(File(image.path));
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.image_rounded,
            ),
            title: Text('Gallery', style: Get.textTheme.bodyMedium),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _image = image;
                });
                widget.onChange(File(image.path));
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}
