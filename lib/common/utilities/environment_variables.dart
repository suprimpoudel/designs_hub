abstract class EnvironmentVariables {
  static const String androidAPIKey = String.fromEnvironment(
    'ANDROID_API_KEY',
    defaultValue: '',
  );

  static const String androidAppId = String.fromEnvironment(
    'ANDROID_APP_ID',
    defaultValue: '',
  );
  static const String androidSenderId = String.fromEnvironment(
    'ANDROID_SENDER_ID',
    defaultValue: '',
  );
  static const String androidProjectId = String.fromEnvironment(
    'ANDROID_PROJECT_ID',
    defaultValue: '',
  );
  static const String androidStorageBucket = String.fromEnvironment(
    'ANDROID_STORAGE_BUCKET',
    defaultValue: '',
  );
  static const String iosAPIKey = String.fromEnvironment(
    'IOS_API_KEY',
    defaultValue: '',
  );
  static const String iosAppId = String.fromEnvironment(
    'IOS_APP_ID',
    defaultValue: '',
  );
  static const String iosSenderId = String.fromEnvironment(
    'IOS_SENDER_ID',
    defaultValue: '',
  );
  static const String iosProjectId = String.fromEnvironment(
    'IOS_PROJECT_ID',
    defaultValue: '',
  );
  static const String iosStorageBucket = String.fromEnvironment(
    'IOS_STORAGE_BUCKET',
    defaultValue: '',
  );
  static const String iosBundleId = String.fromEnvironment(
    'IOS_BUNDLE_ID',
    defaultValue: '',
  );
}
