class Tables {
  Tables._();

  static const _Users users = _Users();
  static const _UsersDevicesToken usersDevicesToken = _UsersDevicesToken();
  static const _Notifications notifications = _Notifications();
  static const _CoachingRequests coachRequests = _CoachingRequests();
  static const _CoachingRelations coachingRelations = _CoachingRelations();
  static const _Programs programs = _Programs();
}

class _Users {
  const _Users();
  String get tableName => 'users';
  String get id => 'id';
  String get name => 'name';
  String get email => 'email';
  String get role => 'role';
}

class _UsersDevicesToken {
  const _UsersDevicesToken();
  String get tableName => 'usersDevicesToken';
  String get userId => 'userId';
  String get deviceId => 'deviceId';
  String get fcmToken => 'fcmToken';
}

class _Notifications {
  const _Notifications();
  String get tableName => 'notifications';
  String get id => 'id';
  String get userId => 'userId';
  String get type => 'type';
  String get isAccepted => 'isAccepted';
  String get createdAt => 'createdAt';
}

class _CoachingRequests {
  const _CoachingRequests();
  String get tableName => 'coachingRequests';
  String get id => 'id';
  String get coachId => 'coachId';
  String get clienteId => 'clienteId';
  String get status => 'status';
}

class _CoachingRelations {
  const _CoachingRelations();
  String get tableName => 'coachingRelations';
  String get id => 'id';
  String get coachId => 'coachId';
  String get clienteId => 'clienteId';
}

class _Programs {
  const _Programs();
  String get tableName => 'programs';
  String get coachId => 'coachId';
  String get clienteId => 'clienteId';
  String get program => 'program';
  String get latestProgramNum => 'latestProgramNum';
  String get lastUpdatedBy => 'lastUpdatedBy';
}