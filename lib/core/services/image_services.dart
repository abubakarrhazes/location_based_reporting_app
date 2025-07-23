import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class MediaService {
  static final ImagePicker _picker = ImagePicker();

  static Future<List<String>> pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (images.isEmpty) return [];
      List<String> savedPaths = [];
      for (var image in images) {
        final savedPath = await _saveImageToAppDirectory(File(image.path));
        savedPaths.add(savedPath);
      }

      return savedPaths;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> takePicture() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (photo == null) return null;

      return await _saveImageToAppDirectory(File(photo.path));
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> _saveImageToAppDirectory(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      final savedImage = await imageFile.copy('${directory.path}/$fileName');
      return savedImage.path;
    } catch (e) {
      rethrow;
    }
  }
}
