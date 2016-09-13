#include <Servo.h>
#include <SoftwareSerial.h>  

int bluetoothTx = 2;  // TX-O pin of bluetooth mate, Arduino D2
int bluetoothRx = 3;  // RX-I pin of bluetooth mate, Arduino D3

SoftwareSerial bluetooth(bluetoothTx, bluetoothRx);

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
  
  bluetooth.begin(115200);  // The Bluetooth Mate defaults to 115200bps
  bluetooth.print("$");  // Print three times individually
  bluetooth.print("$");
  bluetooth.print("$");  // Enter command mode
  delay(100);  // Short delay, wait for the Mate to send back CMD
  bluetooth.println("U,9600,N");  // Temporarily Change the baudrate to 9600, no parity
  // 115200 can be too fast at times for NewSoftSerial to relay the data reliably
  bluetooth.begin(9600);  // Start bluetooth serial at 9600

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
  servoRight.write(1800);
  delay(100);
  servoRight.detach();
  servoLeft.detach();
}

void back() {
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(1800);
  servoRight.write(0);
  delay(100);
  servoRight.detach();
  servoLeft.detach();
}

void left() {
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(180);
  delay(100);
  servoLeft.detach();
  servoRight.detach();
}

void right() {
  servoRight.attach(10);
  servoLeft.attach(9);
  servoLeft.write(0);
  servoRight.write(0);
  delay(100);
  servoRight.detach();
  servoLeft.detach();
}


void loop() {
  
  if (bluetooth.available()>0)
  {
    data = (char)(bluetooth.read());
    //Serial.println(data);  
    if (data == 'q')
        sharp_left();
    else if (data == 'e')
        sharp_right();
    else if (data == 'p')
        stop_bot();
    else if (data == 'w')
        back();
    else if (data == 'd')
        right();
    else if (data == 'a')
        left();
    else if (data == 's')
        forward();
        
  }       
}
