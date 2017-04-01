/*  
 *  ------ [USB_1]  -------- 
 *  
 *  Explanation: This example shows how to use the USB port: turn USB ON,
 *  turn USB OFF, print chars, strings...
 *  
 *  Copyright (C) 2016 Libelium Comunicaciones Distribuidas S.L. 
 *  http://www.libelium.com 
 *  
 *  This program is free software: you can redistribute it and/or modify 
 *  it under the terms of the GNU General Public License as published by 
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version. 
 *  
 *  This program is distributed in the hope that it will be useful, 
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *  GNU General Public License for more details. 
 *  
 *  You should have received a copy of the GNU General Public License 
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 *  
 *  Version:           3.0
 *  Design:            David Gascon
 *  Implementation:    Yuri Carmona, Marcos Yarza
 */

// variables
unsigned long time = 0;
int val = 0;

void setup()
{

}

void loop()
{

    USB.ON();

    USB.println(F("------------------------------------"));
    USB.printf("%s\n", "Inicio"); // with line break
    USB.printf("millis: %lu\n",millis());  
    USB.println(F("------------------------------------"));
    USB.println(F("Wait for 3 seconds"));
    USB.print(F("Received: "));

    time = millis();

    USB.flush();
    
    while(millis()-time < 10000)
    {
        if (USB.available() > 0)
        {
            val = USB.read();
            USB.print(val,BYTE);
        }

        // Condition to avoid an overflow (DO NOT REMOVE)
        if (millis() < time)
        {
            time = millis();	
        }
    }

    // print an separator line
    USB.println(F("\n------------------------------------"));

    USB.println(F("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"));

    // Closing UART 
    USB.OFF();
    delay(3000);
}



