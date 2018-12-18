void setup() {

  Serial.begin(9600);
  // Serial.println("Hello");
}

void loop() {

  int value_0 = analogRead(0);
  
  Serial.println(value_0);

  
  delay(100);

}
