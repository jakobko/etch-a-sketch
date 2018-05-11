const int xPin = A0;
const int yPin = A1;
const int tiltPin = 8;

int tiltSwitch = 0;


void setup() {
  Serial.begin(9600);
  pinMode(tiltPin, INPUT);
}

void loop() {
  int xVerdi = analogRead(xPin);
  int yVerdi = analogRead(yPin);
  tiltSwitch = digitalRead(tiltPin);

  Serial.print(xVerdi);
  Serial.print("; ");
  Serial.print(yVerdi);
  Serial.print("; ");
  Serial.println(tiltSwitch);
  delay(50);
}
