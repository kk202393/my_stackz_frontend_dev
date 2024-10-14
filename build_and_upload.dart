import 'dart:convert'; // For JSON decoding
import 'dart:io';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:path/path.dart' as path;

// Path to your Google Drive credentials.json
const _credentialsFile = 'credentials.json';

// Google Drive folder ID where APK will be uploaded
const _folderId = '1s-z_7aaS10YaLEyMXf49hWmHhW28wq6P';

Future<void> main() async {
  // Step 1: Build the APK
  await buildApk();

  // Step 2: Delete the previous APK on Google Drive
  await deletePreviousApk();

  // Step 3: Upload the new APK
  await uploadNewApk();
}

Future<void> buildApk() async {
  // Detect the platform and adjust the flutter command for Windows
  String flutterCommand = Platform.isWindows ? 'flutter.bat' : 'flutter';

  // Run Flutter build command
  final result = await Process.run(flutterCommand, ['build', 'apk']);

  if (result.exitCode != 0) {
    print('Build failed: ${result.stderr}');
    return;
  }
  print('APK built successfully');
}

Future<void> deletePreviousApk() async {
  // Delete the previous APK from Google Drive (if necessary)
  final driveApi = await _initializeDriveApi();
  final fileList = await driveApi.files.list(
    q: "'$_folderId' in parents",
    orderBy: 'createdTime desc',
    pageSize: 1,
  );

  if (fileList.files?.isNotEmpty ?? false) {
    final oldFileId = fileList.files!.first.id;
    if (oldFileId != null) {
      await driveApi.files.delete(oldFileId);
      print('Previous APK deleted');
    }
  } else {
    print('No previous APK found');
  }
}

Future<void> uploadNewApk() async {
  final buildNumber = await _getBuildNumber();
  final apkFilePath =
      path.join('build', 'app', 'outputs', 'apk', 'release', 'app-release.apk');
  final apkFile = File(apkFilePath);

  if (!apkFile.existsSync()) {
    print('APK file not found!');
    return;
  }

  final driveApi = await _initializeDriveApi();
  final fileName = 'app-release-v$buildNumber.apk';
  final media = drive.Media(apkFile.openRead(), apkFile.lengthSync());

  final driveFile = drive.File()
    ..name = fileName
    ..parents = [_folderId];

  final uploadedFile =
      await driveApi.files.create(driveFile, uploadMedia: media);
  print('Uploaded APK with ID: ${uploadedFile.id}');

  // Update build number for next run
  await _incrementBuildNumber();
}

Future<drive.DriveApi> _initializeDriveApi() async {
  // Load credentials.json from file
  final credentialsFile = File(_credentialsFile);
  if (!credentialsFile.existsSync()) {
    throw Exception('Missing credentials.json file.');
  }

  // Read and parse the JSON credentials
  final credentialsJson = jsonDecode(await credentialsFile.readAsString());

  // Extract client_id and client_secret
  final clientId = ClientId(
    credentialsJson['installed']['client_id'],
    credentialsJson['installed']['client_secret'],
  );

  // Initialize OAuth2 flow
  final authClient = await clientViaUserConsent(
    clientId,
    [drive.DriveApi.driveFileScope],
    (url) {
      print('Please go to the following URL and grant access:');
      print('  => $url');
    },
  );

  return drive.DriveApi(authClient);
}

Future<int> _getBuildNumber() async {
  final file = File('build_number.txt');
  if (file.existsSync()) {
    final content = await file.readAsString();
    return int.tryParse(content.trim()) ?? 1;
  } else {
    return 1;
  }
}

Future<void> _incrementBuildNumber() async {
  final currentBuildNumber = await _getBuildNumber();
  final file = File('build_number.txt');
  await file.writeAsString((currentBuildNumber + 1).toString());
}
