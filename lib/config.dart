class Config {
  static const BACKEND_URL = String.fromEnvironment('BACKEND_URL',
      defaultValue:
          'https://smartschool-admin.smartlearning.lk/api/V1/users?bulk=true');
}
