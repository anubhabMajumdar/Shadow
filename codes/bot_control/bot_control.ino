#include <Servo.h>

char data;

Servo servoLeft;          // create servo objects
Servo servoRight;

int leftpin = 9;
int rightpin = 10;

void setup() 
{
  servoLeft.detach();
  servoRight.detach();
  
  // put your setup code here, to run once:
  pinMode (leftpin, OUTPUT);
  pinMode (rightpin, OUTPUT);
  
  Serial.begin(9600);
  Serial.println("Start");
}

void sharp_left(){
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(180);
  delay(700);
  servoLeft.detach();
  servoRight.detach();
  Serial.print(1);
}

void stop_bot(){
  servoRight.detach();
  servoLeft.detach();
  delay(50);
  
}


void sharp_right() {
  servoRight.attach(10);
  servoLeft.attach(9);
  servoRight.write(0);
  servoLeft.write(0);
  delay(700);
  servoRight.detach();
  servoLeft.detach();
  Serial.print(1);  
}

void forward() {
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(0);
  servoRight.write(180);
  delay(100);
  servoRight.detach();
  servoLeft.detach();
}


void right() {
  servoLeft.attach(9);
  servoLeft.write(0);
  servoRight.write(0);
  delay(100);
  servoLeft.detach();
  servoRight.detach();
}

void left() {
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(180);
  delay(100);
  servoRight.detach();
  servoLeft.detach();
}


void loop() {
  
  if (Serial.available()>0)
  {
    data = (char)(Serial.read());
    //Serial.println(data);  
    if (data == 'L')
        sharp_left();
    else if (data == 'R')
        sharp_right();
    else if (data == 'E')
        stop_bot();
    else if (data == 'w')
        forward();
    else if (data == 'd')
        right();
    else if (data == 'a')
        left();
        
  }       
}
