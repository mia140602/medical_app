abstract class ConfirmationEvent{}

class ConfirmationCodeChange extends ConfirmationEvent{
  final String code;
  ConfirmationCodeChange({required this.code});
}

class ConfirmationSubmitted extends ConfirmationEvent{}