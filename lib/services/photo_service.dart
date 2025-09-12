import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

///Providing and saving photos locally along with the deviceDocDir
class PhotoService {
  PermissionStatus _cameraPermissionStatus = PermissionStatus.denied;
  PermissionStatus _storagePermissionStatus = PermissionStatus.denied;
  late Directory devDocDir;
  Directory get getDevDocDir => devDocDir;

  //handling the async initializations here rather than in the widgets
  PhotoService._(this.devDocDir);

  static Future<PhotoService> create() async {
    final Directory docDir = await getApplicationDocumentsDirectory();
    return PhotoService._(docDir);
  }

  // A function to check and request permissions.
  Future<bool> _checkPermissions() async {
    // Check the current status of camera and storage permissions.
    _cameraPermissionStatus = await Permission.camera.status;
    _storagePermissionStatus = await Permission.storage.status;

    if (_cameraPermissionStatus.isGranted &&
        _storagePermissionStatus.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _requestPermissions() async {
    // Request both camera and storage permissions at once.
    // The storage permission is needed to save the file locally.
    final statuses = await [Permission.camera, Permission.storage].request();
    _cameraPermissionStatus = statuses[Permission.camera]!;
    _storagePermissionStatus = statuses[Permission.storage]!;
  }

  Future<File?> takePhoto() async {
    final allGranted = await _checkPermissions();
    if (allGranted) {
      //per l'imagePicker globalmente oltre al return null
      try {
        final imagePicker = ImagePicker();
        final pickedFile = await imagePicker.pickImage(
          source: ImageSource.camera,
        );
        if (pickedFile != null) {
          return File(pickedFile.path);
        } else {
          return null;
        }
      } catch (e) {
        print('Error taking photo: $e');
        return null;
      }
    } else {
      await _requestPermissions();
      return null;
    }
  }

  /// Include also .jpg in the file name
  Future<bool> savePhoto({
    required String imgFolderPathString,
    required String imgName,
    required File photoFile,
  }) async {
    try {
      final Directory imgDir = Directory(
        '${devDocDir.path}/$imgFolderPathString',
      );
      if (!await imgDir.exists()) {
        await imgDir.create(recursive: true);
      }
      final String newPath = '${imgDir.path}/$imgName';
      await photoFile.copy(newPath);
      return true;
    } catch (e) {
      print('Error saving photo: $e');
      return false;
    }
  }
}
