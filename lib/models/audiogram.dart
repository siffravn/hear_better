import 'dart:math';

class Audiogram {

  var _frequencies = new List();
  var _rightEar = new List();
  var _leftEar = new List();
  List<DataPoint> idealHearing = new List();

  Audiogram() {
    _frequencies = [250, 1000, 2000, 4000, 6000, 8000];
    // Currently always creates dummy data
    makeDummyData();
    for (int i = 0; i < _frequencies.length; i++) {
      idealHearing.add(new DataPoint(_frequencies[i], 20));
    }
  }

  void makeDummyData() {
    Random random = new Random();
    int maxStartValue = 25;
    int leftStartValue = random.nextInt(25);
    int rightStartValue = random.nextInt(25);
    _rightEar.add(rightStartValue);
    _leftEar.add(leftStartValue);

    for (int i = 1; i < _frequencies.length; i++) {
      if (i < 4) {
        rightStartValue += random.nextInt(10);
        _rightEar.add(rightStartValue);
        leftStartValue += random.nextInt(10);
        _leftEar.add(leftStartValue);
      } else {
        rightStartValue += random.nextInt(20);
        _rightEar.add(rightStartValue);
        leftStartValue += random.nextInt(20);
        _leftEar.add(leftStartValue);
      }
    }
  }

  void addDataPoint() {
    // TODO add data point to audiogram
  }


  List<DataPoint> getLeftEarDataPoints() {
    List<DataPoint> datapoints = List();
    for (int i = 0; i < _frequencies.length; i++) {
      datapoints.add(DataPoint(_frequencies[i], _leftEar[i]));
    }
    return datapoints;
  }

  List<DataPoint> getRightEarDataPoints() {
    List<DataPoint> datapoints = List();
    for (int i = 0; i < _frequencies.length; i++) {
      datapoints.add(DataPoint(_frequencies[i], _rightEar[i]));
    }
    return datapoints;
  }
  List<DataPoint> getIdealHearing() {
    return idealHearing;
  }

}

class DataPoint {
  int decibel;
  int frequency;

  DataPoint(this.frequency, this.decibel);
}