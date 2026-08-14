class AppRoutes {
  AppRoutes._();

  static const String homeName = 'home';
  static const String homePath = '/home';

  static const String programsName = 'programs';
  static const String programsPath = '/programs';

  static const String userName = 'user';
  static const String userPath = '/user';

  static const String loginName = 'login';
  static const String loginPath = '/login';

  static const String registerName = 'register';
  static const String registerPath = '/register';

  static const String notificationsName = 'notifications';
  static const String notificationsPath = '/notifications';

  static const String searchCoachName = 'searchCoach';
  static const String searchCoachPath = 'searchCoach';

  static const String coachingRequestName = 'coachingRequest';
  static const String coachingRequestPath = 'coachingRequest';

  static const String settingsName = 'settings';
  static const String settingsPath = 'settings';

  static const String requestsListName = 'requestsList';
  static const String requestsListPath = 'requestsList';

  static const String clienteCoachingRequestName = 'clienteCoachingRequest';
  static const String clienteCoachingRequestPath = 'clienteCoachingRequest';

  static const String ownCoachingRelationName = 'ownCoachingRelation';
  static const String ownCoachingRelationPath = 'ownCoachingRelation';

  static const String coachClientiListName = 'coachClientiList';
  static const String coachClientiListPath = '/coachClientiList';

  static const String clienteInfoEProgramsName = 'clienteInfoEPrograms';
  static const String clienteInfoEProgramsPath = 'clienteInfoEPrograms';

  static const String editProgramName = 'editProgram';
  static const String editProgramPath = 'editProgram';

  static const String dayScreenName = 'day';
  static const String dayScreenPath = 'day';

  static const String exerciseScreenName = 'exercise';
  static const String exerciseScreenPath = 'exercise';


  static const List<String> rootScreensNames = [homeName, programsName, userName, coachClientiListName];
  static const List<String> onlyTopBarNames = [editProgramName, exerciseScreenName];
}