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
    
    if (sensors.length == 6){
     
      
      OscMessage myMessage = new OscMessage("/test");
      
      float num_0 = map(sensors[0], 0, 1023, 0.0, 1.0);
      float num_1 = map(sensors[1], 0, 1023, 0.0, 1.0);
      float num_2 = map(sensors[2], 0, 1023, 0.0, 1.0);
      int int_3 = int(map(sensors[3], 0, 1023, 0, 9));
      int int_4 = int(map(sensors[4], 0, 1023, 0, 9));
      float num_5 = map(sensors[5], 0, 1023, 0.5, 3.0);
      
      myMessage.add(num_0);//add message
      myMessage.add(num_1);
      myMessage.add(num_2);
      myMessage.add(int_3);
      myMessage.add(int_4);
      myMessage.add(num_5);
      
      oscP5.send(myMessage, myRemoteLocation); 
    
    }
  }
  

}


