// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 15;
int rows = 15;

void setup() {
  size(400,400);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      //grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
  save("diagonal2.png");
   noLoop();
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.02; 
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    //fill(127+127*sin(angle));
    int colors[] = new int[6];
    colors[0] = 0;
    colors[1] = 50;
    colors[2] = 87;
    colors[3] = 167;
    colors[4] = 209;
    colors[5] = 255;
    
    int rand = (int)random(0,6); 
    fill(colors[rand]); 
    rect(x,y,w,h); 
  }
}
