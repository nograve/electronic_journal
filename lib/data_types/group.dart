class Group {
  Group(this._course, this._groupNum, this._marker);

  String _marker;
  int _course, _groupNum;

  String get marker => _marker;
  int get course => _course;
  int get groupNum => _groupNum;
}