int ledPin=13;
int matlabData;
 
void setup() 
{
  pinMode(ledPin,OUTPUT);
  Serial.begin(9600);
  Serial.println("Start");
}
 
void loop() 
{
   
   if(Serial.available()>0) // if there is data to read
   {
    matlabData=Serial.read() - 48; // read data
    Serial.println(matlabData);
    if(matlabData==1)
      digitalWrite(ledPin,HIGH); // turn light on
    else if(matlabData==2)
      digitalWrite(ledPin,LOW); // turn light off
  }
}
