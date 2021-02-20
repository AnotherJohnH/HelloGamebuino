//
// Adapted from the Gamebuino "a_Hello" example
//

#include <Gamebuino.h>

Gamebuino gb;

//! setup routine runs once when Gamebuino starts up
//! called from the arduino main()
void setup()
{
   gb.begin();
   gb.titleScreen(F("Hello-world app"));
   gb.popup(F("Let's go!"), 100);
}

//! loop routine runs over and over again forever
//! called from the arduino main()
void loop()
{
   // updates the gamebuino (the display, the sound, the auto backlight... everything)
   // returns true when it's time to render a new frame (20 times/second)
   if(gb.update())
   {
      gb.display.println(F("Hello, world!"));
      gb.display.println(gb.frameCount);
   }
}
