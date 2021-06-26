class Group {
  Group(this._course, this._groupNum, this._marker);

  final String _marker;
  final int _course, _groupNum;

  String get marker => _marker;
  int get course => _course;
  int get groupNum => _groupNum;
}