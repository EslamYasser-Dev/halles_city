import 'dart:core';

class Room {
  String name;
  num pricePerhoure;
  int numberOfChairs;
  int numOfTables;
  bool hasBoard;
  bool hasDataShow;
  bool hasSoundSystem;
  bool hasAirCondition;

  Room(
      {this.name,
      this.pricePerhoure,
      this.numberOfChairs,
      this.numOfTables,
      this.hasBoard,
      this.hasDataShow,
      this.hasSoundSystem,
      this.hasAirCondition});
}
