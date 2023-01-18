import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_project/business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';

XFile? img;
class ProfileImage extends StatelessWidget {
  ProfileImage({super.key, required this.userPath});
  String? userPath;
  image(state, context) {
    if (state.image == null) {
      if (userPath == null) {
        return AssetImage("assets/images/default_profile_image.png");
      }
      return CachedNetworkImageProvider(userPath!);
    } else {
      return FileImage(
        File(state.image!.path),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UploadImageCubit, UploadImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              BlocListener<UploadImageCubit, UploadImageState>(
                listener: (context, state) {
                  if (state.image != img) {
                    img = state.image;
                  }
                },
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: image(state, context),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      BlocProvider.of<UploadImageCubit>(context).uploadImage();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      BlocProvider.of<UploadImageCubit>(context).resetImage();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
