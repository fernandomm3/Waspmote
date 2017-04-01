/*  
 *  ------ [802_02] - send packets -------- 
 */
 
#include <WaspXBee802.h>

// Destination MAC address
char destino[] = "0013A20041499BA7";

// define variable
uint8_t error;
int contador = 1000;

void setup()
{
  // init USB port
  USB.ON();
  
  // init XBee
  xbee802.ON();
}

void loop()
{
  USB.println(F("------------------------------------"));

  contador++;
  char data[] = "this_is_the_data_field";

  // send XBee packet
  error = xbee802.send( destino, data );   
  
  // check TX flag
  if( error == 0 )
  {
    USB.println(F("send ok"));
  }
  else 
  {
    USB.println(F("send error"));
  }

  // wait for five seconds
  delay(5000);
}



