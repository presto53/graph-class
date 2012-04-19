class graph {
  float[] coordinates;
  int lineWidth;
  color lineColor;
  int graphWidth;
  int graphHeight;
  int xStart;
  int yStart;
  float yCoordinate;

  graph(int _graphWidth, int _graphHeight, int _lineWidth, color _lineColor, int _xStart, int _yStart) {
    graphWidth = _graphWidth;
    graphHeight = _graphHeight;
    lineWidth = _lineWidth;
    lineColor = _lineColor;
    xStart = _xStart;
    yStart = _yStart;
    coordinates = new float[graphWidth];
    for (int i=0; i < graphWidth; i++) {
      coordinates[i]=0;
    }
  }
  void display() {
    stroke(lineColor);
    strokeWeight(lineWidth);
    pushMatrix();
    translate(xStart, yStart);
    for (int j=0; j < graphWidth; j++) {
      if (j>0) {
        line(j-1, -coordinates[j-1]*5, j, -coordinates[j]*5);
      }
    }
    popMatrix();
  }

  void push(float _yCoordinate) {
    yCoordinate = _yCoordinate;
    for (int j=0; j < graphWidth; j++) {
      if ((j+1)==graphWidth) {
        coordinates[j]=constrain(yCoordinate, 0, graphHeight);
      }
      else {
        coordinates[j]=coordinates[j+1];
      }
    }
  }
}

