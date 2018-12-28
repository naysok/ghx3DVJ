void setup() {
  // put your setup code here, to run once:
  Serial.begin(19200);
  // Serial.println("Hello");
}

void loop() {
  // put your main code here, to run repeatedly:
  int value_0 = analogRead(0);
  int value_1 = analogRead(1);
  int value_2 = analogRead(2);
  int value_3 = analogRead(3);
  int value_4 = analogRead(4);
  int value_5 = analogRead(5);

  
  Serial.print(value_0);
  Serial.print(",");
  Serial.print(value_1);
  Serial.print(",");
  Serial.print(value_2);
  Serial.print(",");
  Serial.print(value_3);
  Serial.print(",");
  Serial.print(value_4);
  Serial.print(",");
  Serial.println(value_5);
  
  delay(100);

}
