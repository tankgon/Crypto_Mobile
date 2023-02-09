class IDay {
  String dayS;
  int dayI;
  String state;
  IDay(this.dayS, this.dayI, this.state);
}

final List<IDay> days = [
  IDay('SAT', 21, 'ide'),
  IDay('SUN', 22, 'ide'),
  IDay('MON', 23, 'busy'),
  IDay('TUE', 24, 'active'),
];
