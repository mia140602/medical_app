abstract class AppEvent{
  const AppEvent();

}
class TriggerAppEvent extends AppEvent{
  //khi 1 class exxtend 1 class khác thì phải có supper
  final int index;
  const TriggerAppEvent(this.index):super();
}