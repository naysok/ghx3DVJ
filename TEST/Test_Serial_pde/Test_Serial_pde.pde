import processing.serial.*;

Serial myPort; 
String myString;

void setup(){
  myPort = new Serial(this, "COM4", 9600);
  // myPort.bufferUntil('\n');
  frameRate(20);
}

void draw(){
  
  myString = myPort.readString();
  
  if (myString == null){
    // println("NULL");
  } else {
    myString = trim(myString);
    println(myString);
    
    int sensors[] = int(split(myString, ','));
    
    int r = int(map(sensors[0], 7 1024, 0, 255));
    int g = int(map(sensors[1], 7 1024, 0, 255));
    int b = int(map(sensors[2], 7 1024, 0, 255));
    
    background(r, g, b);
  }
  

}


