import processing.serial.*;
import oscP5.*;
import netP5.*;

Serial myPort; 
String myString = "0,0";
OscP5 oscP5;
NetAddress myRemoteLocation;


void setup(){
  myPort = new Serial(this, "COM4", 9600);
  frameRate(15);
  
  oscP5 = new OscP5(this,1234);
  myRemoteLocation = new NetAddress("127.0.0.1", 5555);
  
}

void draw(){
  
  myString = myPort.readString();
  
  if (myString == null){
    // println("NULL");
  } else {
    myString = trim(myString);
    println(myString);
    
    int sensors[] = int(split(myString, ','));
    
    print(sensors.length);
    
    if (sensors.length == 3){
     
      
      OscMessage myMessage = new OscMessage("/test");
      
      int r = int(map(sensors[0], 10, 1024, 5, 250));
      int g = int(map(sensors[1], 10, 1024, 5, 250));
      int b = int(map(sensors[2], 10, 1024, 5, 250));
      
      myMessage.add(r);//add message
      myMessage.add(g);
      myMessage.add(b);
      
      oscP5.send(myMessage, myRemoteLocation); 
    
      background(r, g, b);
    }
  }
  

}


