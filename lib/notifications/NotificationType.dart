enum NotificationType {
  coachingRequest,
  coachingRequestResult,
  newProgram,
  programUpdated,
  generic;

  static NotificationType fromString(String? type) {
    switch (type) {
      case 'coachingRequest':
        return NotificationType.coachingRequest;
      case 'coachingRequestResult':
        return NotificationType.coachingRequestResult;
      case 'newProgram':
        return NotificationType.newProgram;
      case 'programUpdated':
        return NotificationType.programUpdated;
      default:
        return NotificationType.generic;
    }
  }
}