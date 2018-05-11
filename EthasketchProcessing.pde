import processing.serial.*;

Serial p;
int xPos;
int yPos;
int tilt;
int tid;

void setup() {
  size(1023, 1023);
  background(255,255,255);
  fill(0,0,0);
  
  p = new Serial(this, Serial.list()[2], 9600);
  noStroke();
  
  tid = 0;
}


void draw() {
  if (p.available() > 0) {
    
    String inString = p.readString();
    inString = trim(inString);
    String data[] = split(inString, ';');
    if (data.length == 3) { 
    String xValue = trim(data[0]); 
    String yValue = trim(data[1]);
    String tiltValue = trim(data[2]);
    
    xPos = int(xValue);
    yPos = int(yValue);
    tilt = int(tiltValue);
    }
    
    println(tilt);
    if (xPos > 100 && yPos > 100) {
      ellipse(xPos, yPos, 5, 5);
    }
    
    if (tilt == 0) {
      tid++;
      if (tid > 30) {
        background(255,255,255);
      }
    }
    else if (tilt == 1) {
      tid = 0;
    } 
    
    
  }
  
}