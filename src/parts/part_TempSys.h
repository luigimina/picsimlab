/* ########################################################################

   PICsimLab - PIC laboratory simulator

   ########################################################################

   Copyright (c) : 2010-2021  Luis Claudio Gambôa Lopes

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   For e-mail suggestions :  lcgamboa@yahoo.com
   ######################################################################## */

#ifndef PART_TEMPSYS_H
#define PART_TEMPSYS_H

#include<lxrad.h>
#include"part.h"

#define PART_TEMPSYS_Name "Temperature System"

class cpart_tempsys : public part {
public:

    lxString GetName(void) {
        return lxT(PART_TEMPSYS_Name);
    };
    lxString GetAboutInfo(void){return lxT("L.C. Gamboa \n <lcgamboa@yahoo.com>");};          
    cpart_tempsys(unsigned x, unsigned y);
    ~cpart_tempsys(void);
    void Draw(void);
    void Process(void);
    void PostProcess(void);
    void EvMouseButtonPress(uint button, uint x, uint y, uint state);
    void EvMouseButtonRelease(uint button, uint x, uint y, uint state);
    void EvMouseMove(uint button, uint x, uint y, uint state);
    void ConfigurePropertiesWindow(CPWindow * WProp);
    void ReadPropertiesWindow(CPWindow * WProp);
    lxString WritePreferences(void);
    void ReadPreferences(lxString value);
    void SetOrientation(int orientation);
    unsigned short get_in_id(char * name);
    unsigned short get_out_id(char * name);
private:
    unsigned char input_pins[4];
    lxBitmap * vent[2];
    float temp[2];
    float ref;
    int vtc;
    int vt;
    int rpmstp;
    int rpmc;
    lxFont font;
};




#endif /* PART_TEMPSYS */

