//
// Adapted from a Gamebuino example
//

#include "Gamebuino.h"

Gamebuino gb;

int main(void)
{
   gb.begin();
   gb.titleScreen(F("Hello, world app"));
   gb.popup(F("Let's go!"), 100);

   while(true)
   {
      //updates the gamebuino (the display, the sound, the auto backlight... everything)
      //returns true when it's time to render a new frame (20 times/second)
      if (gb.update())
      {
         gb.display.println(F("Hello, world!"));

         unsigned num_frames = gb.frameCount;
         gb.display.println(num_frames);
      }
   }

   return 0;
}
