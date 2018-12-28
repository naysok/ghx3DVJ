import processing.serial.*;
import oscP5.*;
import netP5.*;

Serial myPort;
String myString = "0,0";
OscP5 oscP5;
NetAddress myRemoteLocation;


void setup(){

  size(300, 300);

  myPort = new Serial(this, "COM4", 19200);
  frameRate(10);

  oscP5 = new OscP5(this,1234);
  myRemoteLocation = new NetAddress("127.0.0.1", 5555);

}

void draw(){


  noStroke();
  fill(0,0,0);
  rect(0,0, width,height);



  // Print FPS
  fill(255);
  stroke(255);
  textSize(14);

  float fr = float(round(frameRate*pow(10,2))) /pow(10,2);
  text(fr+" fps",20,20); // frameRate = fr





  myString = myPort.readString();

  if (myString == null){
    // println("NULL");
  } else {
    myString = trim(myString);
    println(myString);

    int sensors[] = int(split(myString, ','));
    int sensors_p[] = int(split(myString, ','));

//    print(sensors.length);

    if (sensors.length == 6){


      OscMessage myMessage = new OscMessage("/test");

      float num_0 = map(sensors[0], 0, 1023, 0.0, 1.0);
      float num_1 = map(sensors[1], 0, 1023, 0.0, 1.0);
      float num_2 = map(sensors[2], 0, 1023, 0.0, 1.0);
      int int_3 = int(map(sensors[3], 0, 1023, 0, 9));
      int int_4 = int(map(sensors[4], 0, 1023, 0, 9));
      float num_5 = map(sensors[5], 0, 1023, 0.5, 20.0);

      myMessage.add(num_0);//add message
      myMessage.add(num_1);
      myMessage.add(num_2);
      myMessage.add(int_3);
      myMessage.add(int_4);
      myMessage.add(num_5);

      oscP5.send(myMessage, myRemoteLocation);




      // debug
      int s0 = int(map(sensors_p[0], 0, 1023, height, 0));
      int s1 = int(map(sensors_p[1], 0, 1023, height, 0));
      int s2 = int(map(sensors_p[2], 0, 1023, height, 0));
      int s3 = int(map(sensors_p[3], 0, 1023, height, 0));
      int s4 = int(map(sensors_p[4], 0, 1023, height, 0));
      int s5 = int(map(sensors_p[5], 0, 1023, height, 0));

      stroke(0);
      fill(0, 255,255);

      int s_width = int(width/6);

      for (int i = 0; i<6; i++){
        switch(i){
          case 0:
            rect(s_width*i, s0, s_width,height);
            break;
          case 1:
            rect(s_width*i, s1, s_width,height);
            break;
          case 2:
            rect(s_width*i, s2, s_width,height);
            break;
          case 3:
            rect(s_width*i, s3, s_width,height);
            break;
          case 4:
            rect(s_width*i, s4, s_width,height);
            break;
          case 5:
            rect(s_width*i, s5, s_width,height);
            break;
        }
      }


    }
  }


}
