/*
Copyright 2011 Luciano Lélis de Lima <luciano.lelis@gmail.com>

This file is part of Morse Code Blink for arduino UNO.
Morse Code Blink is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/          
// variables
char blink_code[] = "...---... ...---..."; // lol
const int Pin = 13; // the number of the LED pin
const int short_interval = 200; // interval at which to blink (milliseconds)
const int long_interval = 800; // interval at which to blink (milliseconds)
const int space_interval = 1000; // interval at which to blink (milliseconds)
const int end_interval = 10000; // interval at which to blink (milliseconds)
int State = LOW; // ledState used to set the LED
int letterPos = 0; // Current letter you are testing in the morse code
// functions

void blinkled(char morse[], int pos ){
  switch (morse[pos]) { 
   case '.':
      if (State == LOW)
          State = HIGH;
      digitalWrite(Pin, State);
      delay(short_interval);
      State = LOW;
      digitalWrite(Pin, State);
      break;
    
    case '-':
      if (State == LOW)
          State = HIGH;
      digitalWrite(Pin, State);
      delay(long_interval);
      State = LOW; 
      digitalWrite(Pin, State);
      break;
      
    case ' ':
      if (State == HIGH)
          State = LOW;
      digitalWrite(Pin, State);
      delay(space_interval); 
      break;
      
  }
}

void setup() {
  // set the digital pin as output:
  pinMode(Pin, OUTPUT);
}

void loop()
{
  blinkled(blink_code, letterPos);
  delay(500);
  if (letterPos < sizeof(blink_code) - 1) {
    // Move to the next letter in the morse code, unless you are at the end
    letterPos++;
  }
  else {
    // Long pause at the end of the phrase before it starts over again
    letterPos = 0;
    State = LOW;
    digitalWrite(Pin, State);
    delay(end_interval);
  }
  
}


