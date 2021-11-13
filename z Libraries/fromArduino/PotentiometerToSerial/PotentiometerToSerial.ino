
const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to

int sensorValue = 0;        // value read from the pot
int outputValue = 0;        // adjusted value from the sensor

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // read the analog in value:
  sensorValue = analogRead(analogInPin);
  // map it to the range of the analog out:
  outputValue = map(sensorValue, 0, 1023, 0, 255);

  // print the results to the serial monitor to view:
  //Serial.print("sensor = ");
  //Serial.print(sensorValue);
  //Serial.print("\t output = ");
  //Serial.println(outputValue);

  // print the results to serial to read in Processing
  Serial.write(outputValue);

  // wait 50 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(50);
}
