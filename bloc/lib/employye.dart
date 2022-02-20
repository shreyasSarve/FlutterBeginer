class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);


    //Setters

  set id(int _id) {
    this._id = _id;
  }

  set salary(double _salary) {
    this._salary = _salary;
  }

  set name(String _name) {
    this._name = _name;
  }

    //getters
  int get id => _id;
  double get salary => _salary;
  String get name => _name;
}
